#!/bin/bash

# This is a comment line

# Declaring a string variable NAME
NAME="Ruani Lazzarotto"

# Use ${VARIABLE_NAME} to access variable content
# for example, print the variable content in terminal
echo $NAME

# Formatted strings must be callled with quotes to keep the format
FORMATTED_NAME="Ruani

Lazzarotto"
echo "$FORMATTED_NAME"

# Math operations
FIRST_NUMBER = 15
SECOND_NUMBER = 3

TOTAL=$(($FIRST_NUMBER + $SECOND_NUMBER))
echo $TOTAL

# Commands
# Variables can cointain the result of commands
# for example, cat /etc/passwd grep | ruani
CAT_RESULT=$(cat /etc/passwd grep | ruani)
echo "$CAT_RESULT"
