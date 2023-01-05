#!/usr/bin/env bash
#
# extract_titles.sh - Extract title from website

#
# ------------------------------------------------------------------------ #
#  Este programa irá extrair títulos do blog thisIsFinnland, colocar em um arquivo de
#  texto e ler mostrando com cores na tela.
#
#  Exemplos:
#      $ ./extract_titles.sh
#      Neste exemplo o programa vai extrair os titulos e mostrar na tela.
# Testado em:
#   bash 5.0.17
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
ARQUIVO_DE_TITULOS="titles.txt"
SOURCE="https://finland.fi/pt/category/negocios-amp-inovacao/"
VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ ! -x "$(which lynx)" ] && sudo apt install lynx -y # Lynx instalado?
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
lynx -source $SOURCE | grep h2 | sed 's/<h2.*title">//;s/<h2.*<\/h2>//;s/<\/h2.*//' > titles.txt

while read -r titulo_lxer
do
  echo -e "${VERMELHO}Titulo: ${VERDE}$titulo_lxer"
done < "$ARQUIVO_DE_TITULOS"
# ------------------------------------------------------------------------ #