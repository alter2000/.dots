# a source-able file to add server capabilities to zsh
# cuts back way more deps that Python and is my shell of choice
# just point zshttpd to the doc root
typeset -A ZSHTTPD
: ${ZSHTTPD[port]=8080}
: ${ZSHTTPD[verbose]=0}
: ${ZSHTTPD[host]=localhost}
: ${ZSHTTPD[listenfd]=''}
: ${ZSHTTPD[docroot]=''}

typeset -A ZSHTTPD_MIME
ZSHTTPD_MIME=(
		html  text/html
		txt   text/plain
		js    text/javascript
		css   text/css

		gif   image/gif
		jpg   image/jpeg
		jpeg  image/jpeg
)

# -i: ignore error
zmodload -i zsh/net/tcp
zmodload -i zsh/stat

function zshttpd {
		ZSHTTPD[docroot]=$1; shift
		local name value
		for name value in $*
		do
			ZSHTTPD[$name]=$value
		done
		ZSHTTPD[orig_prompt]=$PROMPT
		PROMPT="H $ZSHTTPD[orig_prompt]"
		zshttpd_listen
}

function zshttpd_listen {
		ztcp -l -v $ZSHTTPD[port] || return 1
		ZSHTTPD[listenfd]=$REPLY
		zle -F $ZSHTTPD[listenfd] zshttpd_accept
}

function zshttpd_print_header {
		local code=$1 type=$2 name value; shift; shift
		print HTTP/1.1 $code
		print Host: localhost
		print Connection: keep-alive
		print Content-type: $type
		for name value in $*
		do
			print $name $value
		done
		print ""
}

function zshttpd_accept {
		(($ZSHTTPD[verbose] > 1)) && set -x
		ztcp -a $ZSHTTPD[listenfd] || {
	print "Can't accept?"
	return 1
		}
		local fd=$REPLY
		# Should do access restriction

		local -a query
		local -A request header
		local stat
		while zshttpd_read_header request query header $fd; do
	local target=$ZSHTTPD[docroot]$request[url]
	if [[ -d $target ]] && [[ -r ${target}/index.html ]]; then
			target=${target}/index.html
	fi
	local mtype=${ZSHTTPD_MIME[$target:e]:-text/plain}
	
	if [[ -r $target ]]; then
			stat -H stat $target
			zshttpd_print_header >&$fd "200 Ok" $mtype \
		Content-Length: $stat[size]
			cat >&$fd $target
			(($ZSHTTPD[verbose])) && print -l "($request[url])" ${query}
			# zle -U $request[url]
	else
			zshttpd_print_header >&$fd "404 Not found" text/plain
			print >&$fd "not found: $request"
	fi
	(($request[keepalive])) || {
			(($ZSHTTPD[verbose])) && print closing $fd
			break
	}
		done
		ztcp -c -v $fd
		(($ZSHTTPD[verbose])) && print closed $fd
		set +x
}

function zshttpd_read_header {
		((ARGC == 4)) || {
	print 1>&2 "Usage: $0 requestVar queryVar headerVar fd#"
	return 1
		}
		#
		local requestVar=$1 queryVar=$2 headerVar=$3 fd=$4
		local -A _header
		local method url version
		#
		read -r -u $fd method url version || return 1
		# print 1>&2 "method=<$method> url=<$url>"
		#
		local key value
		while read -r -u $fd key value && [[ $key != $'\r' ]] && [[ -n $value ]]
		do
			value=${value%$'\r'}
			case $key in
		(*:) # Same property will be overwritten.
		_header[$key:l]=$value
		;;
		(*)  # Continuation by leading space is not supported.
		;;
			esac
		done

		local qstr=''
		case $method in
	(GET)
	local q=$url[(i)\?]
	# print 1>&2 "q=$q; url=<$url>; url#=($#url)"
	if (($q <= $#url)); then
			qstr=$url[$q+1,$#url]
			url=$url[1,$q-1]
	fi
	;;
	(POST)
	# How can I use indirection on assoc array?
	# ${{(P)headerVar}[content-length:]} doesn't work.
	read -r -u $fd -k $_header[content-length:] qstr
	;;
	(*)
	;;
		esac
		local -a _query
		if [[ -n $qstr ]]; then
	set -A _query "${(ps:\0:)"$(zshttpd_parse_query $qstr)"}"
		fi

		integer keepalive=0
		if [[ $_header[connection:] == keep-alive ]]; then
	keepalive=1
		fi    

		# pass all results.
		set -A $requestVar method $method url $url version $version \
	keepalive $keepalive
		set -A $headerVar ${(kv)_header}
		set -A $queryVar $_query
		return 0
}

function zshttpd_parse_query {
		# use this via ${(ps:\0:)"$(this command)"}
		perl -Mstrict -MCGI -we '
			my $cgi = new CGI(shift);
			print join("\0", map {"$_\0" . join("\t", $cgi->param($_))} $cgi->param)
		' $1
}
