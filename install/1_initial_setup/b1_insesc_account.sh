#!/usr/bin/env sh

echo "####################################################################################################"
echo "##### Setting github inesc account public keys (https://help.github.com/articles/generating-ssh-keys)"
echo "####################################################################################################"

cd
mkdir -p ~/.ssh
ssh-keygen -t rsa -C "inesc"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa


echo -e "\n\n"
echo "----------------------------------------------------------------------------------------------------"
echo ">>>>> Public key generated"
echo ">>>>> Add to github account the ssh key: "
cat ~/.ssh/id_rsa.pub
echo ">>>>> To test public key setup run: ssh -T git@github.com"
echo "----------------------------------------------------------------------------------------------------"
