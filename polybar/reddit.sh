#!/bin/bash

# Get Reddit JSON URL from https://www.reddit.com/prefs/feeds/
# Click "your inbox" > "unread messages" > "JSON" and copy the link

url="https://www.reddit.com/message/unread/.json?feed=$(pass Social/www.reddit.com | tail -1)&user=alter2000"

# Set prefix icon

icon=' '

# Set prefix icon color with and without unread messages
unreadColor='#e06c75'
readColor='#e0e0e0'

unread=$(curl -s -A "Linux:com.ss132ikl.polybarinbox:v1.0.0 by /u/132ikl" $url | jq '.["data"]["children"] | length ')
(( "$unread" > "0" )) && echo "%{F$unreadColor}$icon $unread" || echo "%{F$readColor}$icon $unread"
