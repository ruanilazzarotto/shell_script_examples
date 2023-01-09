#!/usr/bin/env bash
#
# header.sh - Shell Basics Operators Usage Example
#
# Site:                     https://github.com/ruanilazzarotto
# Author:                   Ruani Lazzarotto
# Maintenance:              Ruani Lazzarotto
#
# ------------------------------------------------------------------------ #
#  Usage examples of the basics shell operations.
#
# ------------------------------------------------------------------------ #
A=10
B=3


echo "Arithmetic Operators"
R=($A + $B)
echo "A + B = $((A + B))"
R=($A - $B)
echo "A - B = $((A - B))"
R=($A / $B)
echo  "A / B = $((A / B))"
R=($A % $B)
echo "A % B = $((A % B))"
