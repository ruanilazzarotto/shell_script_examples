# env ensures portability between distributions
#!/usr/bin/env bash

# string variables
# use quotes for prevent line breaks
STRING_VARIABLE="EXAMPLE TEXT"
# variable call with quotes too
echo "$STRING_VARIABLE"

# for single condition, use short mode
[ -z "$STRING_VARIABLE" ] && echo "Empty"
# or
[ -z "$STRING_VARIABLE" ] && {
    echo "Empty"
    echo "Other commands"
}

# command execution with $() is more clear 
# code this
echo $(which python)
# instead of
echo `wich python`

# Use backslash to break long code lines
# dialog --stdout  \
#        --menu "User Management" \
#        0 0 0 \
#        list "List all users" \
#        insert "Insert a new user" \
#        delete "Delete a user"

# Avoid using pipes. It may decrease performance
# instead of
cat /etc/password | grep mateus 
# code like this
grep mateus /etc/password 

# Use Here Document for long texts
VAR1="$(cat << EOF
Title
    Some text
    more text
    waaaaaay more text
EOF
)"



