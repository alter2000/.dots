#!/usr/bin/bash

# Get fields from mpc, split by tabs
IFS=$'\t' read artist title \
	<<< "$(mpc --format="%artist% - %title%")"

printf "%s\n" "♫ ♫  $artist $title"
