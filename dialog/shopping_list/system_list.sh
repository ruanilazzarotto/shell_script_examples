#!/usr/bin/env bash
#
# system_items.sh - Market shopping list management system, with dialogs
#
# Email:       ruani.lazzarotto@gmail.com
# Author:      Ruani Lazzarotto
# Maintenance: Ruani Lazzarotto
#
# ----------------------------------------------------------------------------------- #
#  This program do all the funcions of market shopping list management, like:
#  insert, delete, update.
#
#  Examples:
#      $ source sysem_items.sh
#      $ ListItems
# ----------------------------------------------------------------------------------- #
# Tested on:
#   bash 5.0.17
# ----------------------------------------------------------------------------------- #

# ------------------------------- VARIABLES ----------------------------------------- #
DB_FILE="db_items.txt"
SEP=:
TEMP=temp.$$
GREEN="\e[32;1m"
RED="\e[31;1m"

# ------------------------------- TESTS --------------------------------------------- #
[ ! -e "$DB_FILE" ] && echo "ERROR. File not found." && exit 1
[ ! -r "$DB_FILE" ] && echo "ERROR. File does not have read permission." && exit 1
[ ! -w "$DB_FILE" ] && echo "ERROR. File does not have write permission." && exit 1
[ ! -x  "$(which dialog)" ] && sudo apt install dialog 1> /dev/null 2>&1
# ----------------------------------------------------------------------------------- #

# ------------------------------- FUNCTIONS ----------------------------------------- #
ListItems () {
    # ignore comments or blank lines, send return to TEMP file
    egrep -v "^#|^$" "$DB_FILE" | tr : ' ' > "$TEMP"
    dialog --title "Items List" --textbox "$TEMP" 20 40
    rm -f "$TEMP"
}

CheckItem () {
    # -i => ignore case; -q => quiet
    grep -i -q -c "$1$SEP" "$DB_FILE"
}

GetItem () {
    return $(eval dialog --stdout --menu \"Choose a item:\" 0 0 0 $1)
}

InsertItem () {
    local last_id="$(egrep -v "^#|^$" $DB_FILE | sort -g | tail -n 1 | cut -d $SEP -f 1)"
    local next_id="$(($last_id+1))"
            
    local name="$(dialog --title "New Item" --stdout --inputbox "Enter the item name" 0 0)"     
    
    CheckItem "$name" && {
        dialog --title "Erro" --msgbox "Item already exists" 6 40
        exit 1
    }
    
    qty="$(dialog --title "New Item" --stdout --inputbox "Enter the item quantity" 0 0)"
    
    echo "$next_id$SEP$name$SEP$qty" >> "$DB_FILE"
    dialog --title "Success" --msgbox "Item created successfully" 6 40
    
    ListItems 
}

RemoveItem () {
    local items=$(egrep "^#|^$" -v "$DB_FILE" | sort -h | cut -d $SEP -f 1,2 | sed 's/:/ "/;s/$/"/') || "No items"
    local item_id=$(eval dialog --stdout --menu \"Choose a item:\" 0 0 0 $items)
           
    grep -i -v "^$item_id$SEP" "$DB_FILE" > "$TEMP"
    mv "$TEMP" "$DB_FILE"

    dialog --msgbox "Item removed successfully" 0 0
    ListItems

}
# ----------------------------------------------------------------------------------- #

# ------------------------------- EXECUTION ----------------------------------------- #

while :
do
    action=$(dialog --title "Items Management" \
                    --stdout \
                    --menu "Choose an option:" \
                    0 0 0 \
                    list   "List all system items" \
                    insert "Insert a new item" \
                    remove "Remove a item" )
    [  $? -ne 0 ] && exit
    case $action in
        list) ListItems ;;
        insert) 
            InsertItem
        ;;
        remove)
            RemoveItem
        ;;

    esac
done
# ----------------------------------------------------------------------------------- #
