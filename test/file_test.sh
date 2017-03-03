#!/bin/sh

# Check for uncommon filenames [x]
# broken links [ ]
# Orfaned files [ ]
file_test () {
	test_title "Initializing file tests"

	# TODO: Should check filename on langs folders only
	check_filename

	# check_orfaned
	# check_dead_links
}

check_filename () {
	# List of prohibited chars, usage.: find="_ a b c"
	# P.S.: Works flawless <3
	find="_"
	for file in ${1-.}/*; do
		if ( test -d "${file}" ); then
			check_filename "$file"
		fi

		for word in $find; do
			if ( string_contains "$file" "$word" ); then
				test_fail "$file contains $word"
			fi
		done
	done
}
