#!/bin/bash

echo -e "Identificação do usuário LINUX"; echo
read -p "O usuário tem 10 segundos para se identificar: " -t  10 usuario; echo
read -sp "Digite a sua senha: " senha
echo
read -p "Digite seu código de segurança de até 5 dígitos: " -n 5 codigo; echo
echo "-------------------------"
echo -e "CONFIRMAÇÃO DOS DADOS"
echo -e "\n Usuário: $usuario \n Senha: $senha \n Código de segurança: $codigo"; echo
echo "-------------------------"
