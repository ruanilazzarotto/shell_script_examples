#!/usr/bin/env bash
# ------------------------------- VARIABLES ----------------------------------------- #
DEBUG_ACTIVE=0
DEBUG_LEVEL=0

# COLORS
BLACK="30"
RED="31"
GREEN="32"
YELLOW="33"
BLUE="34"
MAGENTA="35"
CYAN="36"
GREY="37"
# BACKGROUND COLORS
BLACK_BG="40"
RED_BG="41"
GREEN_BG="42"
YELLOW_BG="43"
BLUE_BG="44"
MAGENTA_BG="45"
CYAN_BG="46"
GREY_BG="47"
# Reset/Normal
RESET="0"

# Formating
BOLD="1"
BLUR="2"
UNDERLINED="3"
ITALIC="4"
BLINK="5"
NORMAL="0"

DEBUG1_COLOR="\e[${GREEN};${BOLD}m"
DEBUG2_COLOR="\e[${RED_BG};${UNDERLINED}m"

RESET_COLOR="\e[${RESET}m"

# ------------------------------------------------------------------------ #

# ------------------------------- FUNCTIONS ----------------------------------------- #
Debug () {
  [ $1 -le $DEBUG_LEVEL ] && echo -e "${2}Debug $* ------"
}

Sum () {
  local total=0

  for i in $(seq 1 25); do
      Debug 1 "${DEBUG1_COLOR}" "Start with value: $i" "${RESET_COLOR}"
      total=$(($total+$i))
      Debug 2 "${DEBUG2_COLOR}" "After sum: $total" "${RESET_COLOR}"
  done
}
# ------------------------------------------------------------------------ #
case "$1" in
  -d) [ $2 ] && DEBUG_LEVEL=$2 ;;
   *) Sum                     ;;
esac

Sum
# ------------------------------------------------------------------------ #
