#!/bin/sh
debug=false

debug () {
	is_debug_enable && echo "${yellow}debug: ${normal}${1}"
}

info () {
	is_debug_enable && echo "${blue}info: ${normal}${1}"
}

is_debug_enable () {
	if ( ! $debug -n true ); then
		return 1
	fi
}
