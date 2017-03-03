#!/bin/sh
linkpattern='*'

parse_links () {
	if ( $1 =~ $linkpattern); then
		echo $BASH_REMATCH[2]
	fi
}

read_file () {
	awk
	cat $1
}
