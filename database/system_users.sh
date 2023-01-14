#!/usr/bin/env bash
#
# system_users.sh - Users management system
#
# Email:      ruani.lazzarotto@gmail.com
# Autor:      Ruani Lazzarotto
# Manutenção: Ruani Lazzarotto
#
# ----------------------------------------------------------------------------------- #
#  This program do all the funcions of users management, like:
#  insert, delete, update.
#
#  Examples:
#      $ source sysem_users.sh
#      $ ListUsers
# ----------------------------------------------------------------------------------- #
# Tested on:
#   bash 5.0.17
# ----------------------------------------------------------------------------------- #

# ------------------------------- VARIABLES ----------------------------------------- #
DB_FILE="db_users.txt"
GREEN="\e[32;1m"
RED="\e[31;1m"

# ------------------------------- TESTS --------------------------------------------- #
[ ! -e "$DB_FILE" ] && echo "ERROR. File not found." && exit 1
[ ! -r "$DB_FILE" ] && echo "ERROR. File does not have read permission." && exit 1
[ ! -w "$DB_FILE" ] && echo "ERROR. File does not have write permission." && exit 1
# ----------------------------------------------------------------------------------- #

# ------------------------------- FUNCTIONS ----------------------------------------- #
PrintUser () {
    local id="$(echo $1 | cut -d : -f 1)"
    local name="$(echo $1 | cut -d : -f 2)"
    local email="$(echo $1 | cut -d : -f 3)"

    echo -e "${GREEN}ID: ${RED}$id"
    echo -e "${GREEN}NAME: ${RED}$name"
    echo -e "${GREEN}EMAIL: ${RED}$email"
}

ListUsers () {
    while read -r line
    do
        [ "$(echo  $line | cut -c1)" = "#" ] && continue
        [ ! "$line" ] && continue
        PrintUser "$line"
    done < "$DB_FILE"
}
# ----------------------------------------------------------------------------------- #

# ------------------------------- EXECUTION ----------------------------------------- #

# ----------------------------------------------------------------------------------- #
