#!/bin/sh
debug=false

debug () {
	is_debug_enable && echo "${yellow}debug: ${normal}${1}"
	return 0
}

info () {
	echo "${blue}info: ${normal}${1}"
	return 0
}

unimplemented_error () {
	echo "${red}error:${normal} $1 was not implemented yet"
	return 0
}

is_debug_enable () {
	if ( ! $debug -n true ); then
		return 1
	fi
}
