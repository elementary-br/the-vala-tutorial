#!/bin/sh
linkpattern='s/(.*\[.+\]\()(.+)\)/\1&-)/g'
link_filename='/(.*\[.+\]\()/ s/(_)/\-/g'

parse_links () {
	local filename="${1}"
	cat "${1}" | sed -rn ${linkpattern}
}

fix_link () {
	local filename="${1}"
	sed -ri ${link_filename} "$filename"
}
