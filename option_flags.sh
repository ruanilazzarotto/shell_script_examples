#!/usr/bin/env bash
#
# option_flags.sh - Add options and flags
#
# Site:        https://github.com/ruanilazzarotto
# Author:      Ruani Lazzarotto
# Maintenance: Ruani Lazzarotto
#
# ------------------------------------------------------------------------ #
#  Extract users from /etc/passwd, with options to sort and captitalize 
#  result.
#
#  Examples:
#      $ ./option_flags.sh -s -m
#      Return users sorted by name and capitalized
# ------------------------------------------------------------------------ #
# History:
#
#   v1.0 14/12/2020, Ruani:
#     - Included options -h -v -s
#   V1.1 15/12/2022, Ruani:
#     - Replaced IF with CASE logic
#     - Included basename
#   V1.2 18/12/2022, Ruani:
#     - Included option -m
#     - Included 2 flags
#   V1.3 18/12/2022, Ruani:
#     - Included while with shift and variable test
#
# ------------------------------------------------------------------------ #
# Tested with:
#   bash 5.0.17
# ------------------------------------------------------------------------ #

# ------------------------------- VARIABLES-------------------------------------- #
USERS="$(cat /etc/passwd | cut -d : -f 1)"
USAGE_MESSAGE="
  $(basename $0) - [OPTIONS]

  -h - Help menu
  -v - Version
  -s - Sort output
  -m - Capitalize
"
VERSION="v1.3"
SORT_KEY=0
CPTZ_KEY=0
# ------------------------------------------------------------------------ #

# ------------------------------- TESTS ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- EXEC ----------------------------------------- #
while test -n "$1"
do
  case "$1" in
    -h) echo "$USAGE_MESSAGE" && exit 0                   ;;
    -v) echo "$VERSION" && exit 0                         ;;
    -s) SORT_KEY=1                                        ;;
    -m) CPTZ_KEY=1                                        ;;
     *) echo "Invalid option, use -h for help." && exit 1 ;;
  esac
  shift
done

[ $SORT_KEY -eq 1 ] && USERS=$(echo "$USERS" | sort)
[ $CPTZ_KEY -eq 1 ] && USERS=$(echo "$USERS" | tr [a-z] [A-Z])

echo "$USERS"
# ------------------------------------------------------------------------ #
