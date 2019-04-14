#!/bin/bash

if ! which git &> /dev/null ;then
	echo -e "\033[31m No git find!Please install git at first!  \033[0m"
	exit 1
fi

echo -e "\033[31m GiHub Account & Passwd input \033[0m"
read -p "GitHub Account:" ACCOUNT
read -p "GitHub Passwd:" PASSWD 

echo -e "\033[31m Write Account & Passwd into ~/.git-credentials \033[0m"
echo  "https://\{${ACCOUNT}\}:\{${PASSWD}\}@github.com" > ~/.git-credentials
git config --global credential.helper store

echo -e "\033[31m Show git config \033[0m"
git config --list | more

if [ $? -eq 0 ];then
	echo -e "\033[31m Success,enjoy !~~\033[0m"
	echo -e "\033[31m Just need input Account at first,just first time !!! Never need passwd! \033[0m"
else
	echo -e "\033[31m Something wrong,check by yourself ~_~ \033[0m"
	exit 1
fi
