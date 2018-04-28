MEXT = md
## All markdown files in the working directory
SRC = $(wildcard *.$(MEXT))
PREFIX = $(HOME)/.pandoc
BIB = $(HOME)/Documents/bibs/socbib-pandoc.bib
PDFS=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)
TEX=$(SRC:.md=.tex)
DOCX=$(SRC:.md=.docx)
REVEALJS=$(SRC:.md=.html)

all:	$(PDFS) $(HTML) $(TEX) $(DOCX) $(REVEALJS)

pdf:	clean $(PDFS)
html:	clean $(HTML)
tex:	clean $(TEX)
docx:	clean $(DOCX)
revealjs:	clean $(REVEALJS)
mdown:	clean $(SRC)

%.html:	%.md
	pandoc -w html -o $@ $< \
		--self-contained \
		# --template=$(PREFIX)/templates/html.template
		--css=$(PREFIX)/css/pandoc.css \
		# --bibliography=$(BIB)

%.tex:	%.md
	pandoc -w latex -s -o $@ $< \
		--pdf-engine=pdflatex \
		# --template=$(PREFIX)/templates/latex.template
		# --bibliography=$(BIB)

%.revealjs:	%.md
	pandoc -w revealjs -o $@ $< \
		--self-contained \
		-V revealjs-url=$(HOME)/.pandoc/reveal.js
		# --template=$(PREFIX)/templates/revealjs.template
		# --css=$(PREFIX)/css/pandoc.css

%.pdf:	%.md
	pandoc -s \
		--pdf-engine=pdflatex -o $@ $< \
		# --template=$(PREFIX)/templates/latex.template
		--bibliography=$(BIB)

%.docx:	%.md
	pandoc -s -o $@ $<  #--bibliography=$(BIB)

clean:
	rm -f *.html *.pdf *.tex *.aux *.log *.docx

.PHONY: clean
