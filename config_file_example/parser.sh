#!/usr/bin/env bash

CONFIG_FILE="$1"

[ ! -e "$CONFIG_FILE" ] && echo "ERROR: Configuration file does not exists."    && exit 1
[ ! -r "$CONFIG_FILE" ] && echo "ERROR: No read access." && exit 1

while read -r line
do
  [ "$(echo $line | cut -c1)" = "#" ] && continue # If is comment, next
  [ ! "$line" ] && continue # If si blank line, next

  key="$(echo $line | cut -d = -f 1)"
  value="$(echo $line | cut -d = -f 2)"

  echo "CONF_$key=$value"
done < "$CONFIG_FILE"
