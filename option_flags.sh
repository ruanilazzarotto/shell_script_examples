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
"
VERSION="v1.1"
# ------------------------------------------------------------------------ #

# ------------------------------- TESTS ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- EXEC ----------------------------------------- #
case "$1" in
  -h) echo "$USAGE_MESSAGE" && exit 0    ;;
  -v) echo "$VERSION" && exit 0          ;;
  -s) echo "$USERS" | sort && exit 0     ;;
   *) echo "$USERS"                      ;;
esac

# ------------------------------------------------------------------------ #
