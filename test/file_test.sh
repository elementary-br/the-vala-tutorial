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
		if ( ! is_test ${file} ) && ( ! is_gitignored ${file} ); then
			for char in $find; do
				if ( string_contains $(basename "$file") "$char" ); then
					test_fail "$file contains $char"
					echo -n ""
				fi
			done

			# If file is a directory iterate over it
			if ( test -d "${file}" ); then
				check_filename "${file}"
			fi
		fi
	done
}

check_file () {
	if ( test -e $1 ); then
		test_ok "${1} found"
	else
		test_fail "Failed to find ${1}"
	fi
}

# params: $1 > file, $2 > blacklist
cmp_file () {
	for file in ${2}; do
		if ( test ${file} -ef ${1}); then
			# Return true if is equal
			debug "assert $1 == $file is true"
			return 0
		fi
	done
	# Return false else
	return 1
}

# TODO: Find a way to reuse this code
directory_iterator () {
	for file in ${1-.}/*; do
		if ( ! is_test ${file} ) && ( ! is_gitignored ${file} ); then
			if ( test -d "${file}" ); then
				directory_iterator "${file}"
			fi
			echo ${file}
		fi
	done
}

# Check if file is gitignored
is_gitignored () {
	local gitignore=$(cat .gitignore)
	cmp_file "${1}" "${gitignore}" && info "${1} is gitignored"
}

is_test () {
	local testfiles="test.sh test/"
	cmp_file "${1}" "${testfiles}" && info "${1} is a test"
}
