#!/bin/sh
gitignore=$(cat .gitignore)

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

check_file () {
	if ( test -e $1 ); then
		test_ok "${1} found"
	else
		test_fail "Failed to find ${1}"
	fi
}

# TODO: Find a way to reuse this code
directory_iterator () {
	for file in ${1-.}/*; do
		if ( test -d "${file}" ); then
			directory_iterator "$file"
		fi
		echo $file
	done
}

# Check if file is gitignored
# FIXME: Not working
is_gitignored () {
	for file in $gitignore; do
		if ( string_contains ${file} ${1} ); then
			echo "${1} is gitignored"
			return 1
		fi
	done
}
