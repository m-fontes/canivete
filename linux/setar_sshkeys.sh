#!/bin/bash

usage() {
	echo "$0: Creates new pair of public + private SSH keys and sends them to a remote host."
	echo -e "\nUsage: $0 -u <username> -t <target host> [-a <SSH Alias> ][-h]"
}

while getopts ":a:hu:t:" opt; do
	case $opt in
		a)
			SSHALIAS=$OPTARG
			echo "SSH Alias: '$SSHALIAS'"
			;;
		u)
			USERNAME=$OPTARG
			echo "Username: '$USERNAME'"
			;;
		t)
			TARGET=$OPTARG
			echo "Target hostname/IP: '$TARGET'"
			;;
		h)
			usage
			exit 0
			;;
		\?)
			echo "Invalid option: '-$OPTARG'"
			usage
			exit 0
			;;
	esac
done

if [ "$USERNAME" == "" ] || [ "$TARGET" == "" ] || [ "$?" -eq 0 ];
then
	echo "*** Error: username and target hostname/IP are necessary."
	usage
	echo "Exiting now."
	exit 1
fi

# getopts parsing done. Now generating keys with 'ssh-keygen'

USERPATH="/Users/mfontes/.ssh"
echo -e "\nGenerating keys with 'ssh-keygen' on '$USERPATH'..."
ssh-keygen -C "$USERNAME" -f $USERPATH/id_rsa_${USERNAME}_${TARGET} -N ""

# Now sending generated keys to remote host:
ssh-copy-id -i $USERPATH/id_rsa_${USERNAME}_${TARGET} ${USERNAME}@${TARGET}

# Finally, if an alias was passed as argument, let's add this alias to .ssh/config file:
if [ "$SSHALIAS" != "" ];
then
	echo "Including '$SSHALIAS' alias on '${USERPATH}/config' file..."
	cat >> $USERPATH/config <<EOF
Host $SSHALIAS
	HostName $TARGET
	User $USERNAME
	IdentityFile $USERPATH/id_rsa_${USERNAME}_${TARGET}
	
EOF
fi

echo "== End of script =="
exit 0
