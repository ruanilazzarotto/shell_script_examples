#!/usr/bin/env bash
#
# system_users.sh - Users management system
#
# Email:       ruani.lazzarotto@gmail.com
# Author:      Ruani Lazzarotto
# Maintenance: Ruani Lazzarotto
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
SEP=:
TEMP=temp.$$
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

CheckUser () {
    # -i => ignore case; -q => quiet
    grep -i -q -c "$1$SEP" "$DB_FILE"
}

GetUserId () {
    grep -i "$1$SEP" "$DB_FILE" |  cut -d $SEP -f 1
}

InsertUser () {
    local name="$(echo $1 | cut -d $SEP -f 2)"
    if CheckUser "$name"
    then
        echo "ERROR. User already exists!"
    else
        # '>>' => concat operator
        echo "$*" >> "$DB_FILE"
        echo "User created successfully"
    fi
    SortList
}

DeleteUser () {
    CheckUser "$1" || return

    grep -i -v "$1$SEP" "$DB_FILE" > "$TEMP"
    mv "$TEMP" "$DB_FILE"
    SortList
    echo "User deleted successfully"

}

UpdateUser () {
    local name="$(echo $1 | cut -d $SEP -f 2)"
    if CheckItem "$name"
    then 
        local id="$(GetUserId $1)"
        DeleteItem $1
        InsertItem "$id$SEP$1$SEP$2"
        echo "${id}$SEP$1$SEP$2"
        echo "User updated successfully"
        
    else
        echo "ERROR. User does not exists!"
    fi
    SortList
}

SortList () {
    sort "$DB_FILE" > "$TEMP"
    mv "$TEMP" "$DB_FILE"
}
# ----------------------------------------------------------------------------------- #

# ------------------------------- EXECUTION ----------------------------------------- #

# ----------------------------------------------------------------------------------- #
