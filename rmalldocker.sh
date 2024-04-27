#!/bin/bash

# Colores
rojo='\033[0;31m'
verde='\033[0;32m'
amarillo='\033[0;33m'
azul='\033[0;34m'
reset='\033[0m'

echo -e "${rojo}[+]${reset}${azul} CONTENEDORES${reset}"

echo -e "\n$(docker ps)\n"

sleep 1.5

echo -e "\n${rojo}[+]${reset}${verde} BORRANDO${reset}\n"
echo -e "$(docker rm $(docker ps -aq ) --force &>/dev/null)"

sleep 2

echo -e "\n${amarillo}[-] BORRADO CON EXITO${reset}\n"

echo -e "${rojo}[+]${reset}${azul} IMAGENES${reset}"

echo -e "\n$(docker images)\n"

sleep 1.5

echo -e "\n${rojo}[+]${reset}${verde} BORRANDO${reset}\n"

echo -e "$(docker rmi $(docker images -aq ) --force &>/dev/null)"

sleep 2

echo -e "\n${amarillo}[-] BORRADO CON EXITO${reset}\n"

echo -e "${rojo}[+]${reset}${azul} VOLUMENES${reset}"

echo -e "\n$(docker volume ls)\n"

sleep 1.5

echo -e "\n${rojo}[+]${reset}${verde} BORRANDO${reset}\n"
echo -e "\n$(docker volume rm $(docker volume ls -q) --force &>/dev/null)\n"

sleep 2

echo -e "\n${amarillo}[-] BORRADO CON EXITO${reset}\n"
