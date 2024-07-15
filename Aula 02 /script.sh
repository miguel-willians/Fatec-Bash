#!/bin/bash
clear
password="segredo"

validate_password(){
	read -sp "Por favor, insira a senha: " user_password; echo
	if [ "$user_password" != "$password" ]; then
		echo "Senha incorreta. Pressione Enter para tentar novamente."
		read
		validate_password
	fi
}

validate_password

display_menu(){
	echo
	echo "Menu"
	echo "1. Identificar usuário"
	echo "2. Criar usuário"
	echo "3. Apagar usuário"
	echo "4. Sair"
	echo
}

identify_user(){
	echo
	read -p "Digite o nome do usuário: " username 
	if id -u "$username" > /dev/null 2>&1; then
		echo "Usuário ´$username´ já existe."
		id "$username"
	else
		echo "Usuário ´$username´ não está cadastrado." 
	fi
}

create_user(){
	echo
	read -p "Digite o nome de um novo usuário: " username
	echo
	if id -u "$username" > /dev/null 2>&1; then
		echo "Usuário ´$username´ já existe."
	else
		sudo useradd -m "$username"
		read -sp "Digite uma senha para o novo usuário: " user_password
		echo
		echo "$username:$user_password" | sudo chpasswd
		echo "Usuário criado com sucesso!"
	fi 
}

delete_user(){
	echo
	read -p "Digite o nome do usuário que deseja apagar: " username
	if id-u "$username" >/dev/null 2>&1; then 
		echo "Apagando usuário ´$username´ e sua área de trabalho..."
		sudo userdel -r "$username"
		echo "Usuário ´$username´ apagado com sucesso!"
	else
		echo "Usuário ´$username´ não está cadastrado."
}

while true; do
	display_menu
	read -p "Escolha uma opção de 1 a 4: " op
	case "$op" in
		1)identify_user;;
		2)create_user;;
		3)delete_user;;
		4)echo "Saindo";;
		break;;
		*) echo "Opção inválida. Porfavor, escolha uma opção de 1 a 4."
	esac
done
