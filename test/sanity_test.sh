#!/bin/sh

# Perform checks on the project to find out any missing file
sanity_test () {
	# Try to find project files
	test_title "Initializing sanity tests"

	check_file "README.md"
	check_file "LANGS.md"

	# Testing purposes
	# TODO: Remove later
	check_file "FAIL.md"

	# TODO
	# Check each lang dir
	# Needs a parser for the links.
	# Needs a directory iterator
}
