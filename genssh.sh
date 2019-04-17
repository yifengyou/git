#!/bin/bash


# -t: 
# -N:是指密码为空； 
# -f:id_rsa是指保存文件为~/.ssh/id_rsa和~/.ssh/id_rsa.pub 
# -q:指静默模式, 不输出显示
echo -e "\033[31m SSH Key Generator \033[0m"
read -p "Output FileName:" OUTPUT 
ssh-keygen -t rsa -b 4096 -N '' -f ${OUTPUT} -q

if [ $? -eq 0 ];then
	echo -e "\033[31m Gen key Success,enjoy !~~\033[0m"
	echo -e "\033[31m Put ${OUTPUT}.pub to GitHub \033[0m"
	echo -e "\033[31m Put ${OUTPUT} to ~/.ssh/ \033[0m"
else
	echo -e "\033[31m Something wrong,check by yourself ~_~ \033[0m"
	exit 1
fi
