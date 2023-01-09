#!/usr/bin/env bash

CONFIG_FILE="config.cf"
MESSAGE="Test Message"
CAPITALIZE=
USE_COLORS=
RED="\e[31;1m"

eval $(./parser.sh $CONFIG_FILE)

[ "$(echo $CONF_CAPITALIZE)" = "1" ] && CAPITALIZE="1"
[ "$(echo $CONF_USE_COLORS)" = "1" ] && USE_COLORS="1"

[ "$CAPITALIZE" = "1" ] && MENSAGEM="$(echo $MENSAGEM | tr a-z A-Z)"
[ "$USE_COLORS" = "1" ] && MENSAGEM="$(echo -e ${RED}$MENSAGEM)"

echo -e "$MENSAGEM"
