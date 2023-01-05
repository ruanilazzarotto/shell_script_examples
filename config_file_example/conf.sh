#!/usr/bin/env bash
#
# Example of configuration file
#
# ------------------------------- VARIABLES ----------------------------------------- #
CONF_FILE="config.cf"
USE_COLORS=
CAPITALIZE=
MESSAGE="Test Message"

GREEN="\e[32;1m"
RED="\e[31;1m"
# ------------------------------------------------------------------------ #

# ------------------------------- TESTS ----------------------------------------- #
[ ! -r "$CONF_FILE" ] && echo "Do not have reading right" && exit 1
# ------------------------------------------------------------------------ #

# ------------------------------- FUNCTIONS ----------------------------------------- #
SetParameters () {
  local parameter="$(echo $1 | cut -d = -f 1)"
  local value="$(echo $1 | cut -d = -f 2)"

  case "$parameter" in 
    USE_COLORS) USE_COLORS=$value ;;
    CAPITALIZE) CAPITALIZE=$value ;;
  esac
}
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUTION ----------------------------------------- #
while read -r line
do
  [ "$(echo $line | cut -c1)" = "#" ] && continue
  [ ! "$line" ] && continue
  SetParameters "$line"
done < "$CONF_FILE"

[ $CAPITALIZE -eq 1 ] && MESSAGE="$(echo -e $MESSAGE | tr [a-z] [A-Z])"
[ $USE_COLORS -eq 1 ] && MESSAGE="$(echo -e ${GREEN}$MESSAGE)"

echo "$MESSAGE"
# ------------------------------------------------------------------------ #
