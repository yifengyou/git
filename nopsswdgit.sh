#!/bin/bash

if ! which git &> /dev/null ;then
	echo -e "\033[31m No git find!Please install git at first!  \033[0m"
	exit 1
fi

# -----------------------------------------------------------------------------



echo -e "\033[31m GitConfig Email & UserName input \033[0m"
git config -l | grep 'user.email' 
if [ $? -ne 0 ];then
	read -p "GitConfig Email:" Email
	git config --global user.email ${Email}
fi
git config -l | grep 'user.name' 
if [ $? -ne 0 ];then
	read -p "GitConfig UserName:" USERNAME 
	git config --global user.name ${USERNAME}
fi
echo -e "\033[31m GitConfig Finished !\033[0m"

# -----------------------------------------------------------------------------

echo -e "\033[31m GiHub Passwd input \033[0m"
read -p "GitHub Account:" ACCOUNT
read -p "GitHub Passwd:" PASSWD 

echo -e "\033[31m Write Account & Passwd into ~/.git-credentials \033[0m"
echo  "https://\{${ACCOUNT}\}:\{${PASSWD}\}@github.com" > ~/.git-credentials
git config --global credential.helper store

echo -e "\033[31m Show git config \033[0m"
git config --list | more

if [ $? -eq 0 ];then
	echo -e "\033[31m Success,enjoy !~~\033[0m"
	echo -e "\033[31m Just need input Account&Passwd at first,just first time!!! \033[0m"
else
	echo -e "\033[31m Something wrong,check by yourself ~_~ \033[0m"
	exit 1
fi
