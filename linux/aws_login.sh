#!/bin/bash

# Este script facilita parametros/argumentos para logar num Linux da AWS

### [START] Codigos de retorno do script
FUNC_USAGE=1
OPCAO_INVALIDA=2
EXECUCAO_ABORTADA=3
### [END] Codigos de retorno do script

### [START] Valores padrao
AWS_USER=ec2-user
AWS_ADDRESS=52.11.153.89
KEY_PATH=$HOME/.ssh/$AWS_KEY
### [END] Valores padrao

usage() {
	local SCRIPT_NAME=$(basename $0)
	echo "${SCRIPT_NAME} - Facilitando login na AWS"
	echo "Uso: ${SCRIPT_NAME} [-h] [-u <username> | -t <target IP/hostname>]"
	exit ${FUNC_USAGE}
}

while getopts "hu:t:" opt;
do
	case $opt in
		h)
			echo "Imprime funcao de help/uso do script..."
			usage
			;;
		u)
			# Pegando user
			AWS_USER=$OPTARG
			;;
		t)
			# Target IP/hostname
			AWS_ADDRESS=$OPTARG
			;;
		\?)
			echo "Opcao invalida: '-$OPTARG'"
			exit ${OPCAO_INVALIDA}
			;;
	esac
done

# Confirmando valores antes de logar:
echo "O login na AWS sera feito com os seguintes valores: "
echo "User ==> '${AWS_USER}'"
echo "Host/IP ==> '${AWS_ADDRESS}'"
echo "Os valores estao corretos? [y]"
read -n1 -r -p "" INPUT
if [ "${INPUT}" == "y" ];
then
        echo -e "\nProsseguindo com SSH..."
else
        echo -e "\nAbortando execucao."
        exit ${EXECUCAO_ABORTADA}
fi 
ssh -i ${KEY_PATH} ${AWS_USER}@${AWS_ADDRESS}
echo "== Fim do script =="

# Removendo args ja parseados pelo "while getopts"
# Depois disso, $1 passa a ter o primeiro arg passado fora do getopts:
#shift "$((OPTIND-1))"
#echo "O primeiro argumento depois de getopts eh '$1'"

# ssh -i chavesDefault.pem ec2-user@52.11.153.89
