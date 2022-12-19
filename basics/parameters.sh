#!/bin/bash

# Pass Parameters
# Ex. 1
# ./parameters a
# pass "a" as a script parameter
# Ex. 2
# ./parameters a b
# pass "a" and "b" as parameters

# print the first parameter
echo "Firt parameter $1"

# print the second parameter
echo "Second parameter: $2"

# print all parameters
echo "All parameters: $*"

# print parameters count
echo "Parameters count: $#"

# print the last command result
echo "$?"

# print the script PID
echo "$$"
