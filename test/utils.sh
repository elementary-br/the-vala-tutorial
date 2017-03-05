#!/bin/sh

test_ok () {
	echo "   ${green}OK:\t ${normal} ${1}"
	ok=$((ok+1))
	count=$((count+1))
}

test_fail () {
	echo " ${red}FAIL:\t ${normal}${1}"
	fails=$((fails+1))
	count=$((count+1))
}

test_title () {
	echo "${cyan}*${normal} ${1}\n"
}

test_result () {
	echo "\n${green}${ok}${normal} succeded, ${red}${fails}${normal} failed, ${blue}${count}${normal} total"
}

string_contains () {
	string="${1}"
	substring="${2}"
	if test "${string#*$substring}" != "$string"; then
		return 0
	else
		return 1
	fi
}


# Color table
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
yellow='\033[1;33m'
normal='\033[0m'
