#!/usr/bin/env bash
#
# example1.sh - Example of regular expression usage
#
# Site:                     https://github.com/ruanilazzarotto
# Author:                   Ruani Lazzarotto
# Maintenance:              Ruani Lazzarotto
#
# ------------------------------------------------------------------------ #

GROUPS="$(cut -d : -f 1 /etc/group)"
echo 'Grupos que começam com a letra "r" no arquivo /etc/group'
cut -d : -f 1 /etc/group | grep "^r"

echo ''
echo "Grupos que terminem com a letra 't'"
cut -d : -f 1 /etc/group | grep "t$"

echo ''
echo "Grupos que comecem com a letra 'r' e terminem com a letra 't'"
cut -d : -f 1 /etc/group | grep "^r.*t$"

echo ''
echo "Grupos que terminam com a letra 'e' ou 'd'"
cut -d : -f 1 /etc/group | grep "[ed]$"

echo ''
echo "Grupos que não terminam com a letra 'e' ou 'd'"
cut -d : -f 1 /etc/group | grep "[^ed]$"

echo ''
echo "Grupos que tenha seu nome de 2 a 4 dígitos de tamanho"
cut -d : -f 1 /etc/group | egrep "^.{2,4}$"

echo ''
echo "Grupos que comecem com 'r' ou 's' (use o operador OR)"
cut -d : -f 1 /etc/group | grep "^[r|s]"

echo ''
echo "Grupos que começam com qualquer dígito e a segunda letra seja um 'u' ou 'd'"
cut -d : -f 1 /etc/group | grep "^.[ud].*$"
