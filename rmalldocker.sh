#!/bin/bash

# Colors
rojo='\033[0;31m'
verde='\033[0;32m'
amarillo='\033[0;33m'
azul='\033[0;34m'
reset='\033[0m'

userpriv='root'
user=$USER

if [ "$userpriv" == "$user" ]
then
  echo -e "${rojo}[!]${reset}${azul} CONTAINERS${reset}"

  echo -e "\n$(docker ps)\n"

  echo -e "\n${rojo}[+]${reset}${verde} DELETING...${reset}\n"
  echo -e "$(docker rm $(docker ps -aq ) --force &>/dev/null)"

  echo -e "\n${amarillo}[-] SUCCESSFULLY DELETED${reset}\n"

  echo -e "${rojo}[!]${reset}${azul} IMAGES${reset}"

  echo -e "\n$(docker images)\n"

  echo -e "\n${rojo}[+]${reset}${verde} DELETING...${reset}\n"

  echo -e "$(docker rmi $(docker images -aq ) --force &>/dev/null)"

  echo -e "\n${amarillo}[-] SUCCESSFULLY DELETED${reset}\n"

  echo -e "${rojo}[!]${reset}${azul} VOLUMES${reset}"

  echo -e "\n$(docker volume ls)\n"

  echo -e "\n${rojo}[+]${reset}${verde} DELETING...${reset}\n"
  echo -e "\n$(docker volume rm $(docker volume ls -q) --force &>/dev/null)\n"

  echo -e "\n${amarillo}[-] SUCCESSFULLY DELETED${reset}\n"
else
  echo -e "\n\n${amarillo}[!]${reset}${rojo} YOU ARE NOT ROOT${reset}\n"
fi
