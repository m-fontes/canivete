#!/bin/bash

# getopts.sh -- testando uso do getopts

# Formato do while:
# while getopts "<<lista de opcoes>>" <<var que armazenarah>>; do
#	estrutura switch/case
# done

# Obs sobre colon ':' ==> ':' no comeco habilita silent debug, suprimindo algumas msgs de erro (como opcao invalida).
# ==> ':' depois de uma option indica que esta opt precisa de um valor depois dela, e nao eh somente uma flag.

# logo depois do while, ha o uso de:
#     shift "$((OPTIND-1))"
# isso remove todos os argumentos que ja foram parseados pelo while getopts, e depois do shift, $1 passa a ser
# o primeiro argumento passado fora do getopts

while getopts ":h" opt; do
	case $opt in
		h)
			echo "Printing usage/help message"
			;;
		\?)
			echo "Invalid option: '-$OPTARG'"
			;;
	esac
done

# Removendo args ja parseados pelo "while getopts"
# Depois disso, $1 passa a ter o primeiro arg passado fora do getopts:
shift "$((OPTIND-1))"

echo "O primeiro argumento depois de getopts eh '$1'"
