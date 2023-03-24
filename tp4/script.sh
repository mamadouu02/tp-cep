#!/bin/bash

PURPLE='\033[0;35m'
NC='\033[0m'

if [ $# -ne 1 ]
then
    echo "usage: $0 fonction"
    exit 1
fi

echo -e "\n${PURPLE}===== Fonction $1 =====${NC}"

echo -e "\n${PURPLE}===== Génération de l'exécutable =====${NC}\n"
make $1

echo -e "\n${PURPLE}===== Exécution du programme $1 =====${NC}\n"
qemu-system-riscv32 -machine cep -bios none -nographic -kernel $1

echo
read -p "Rediriger la sortie du programme $1 dans le fichier test/$1.sortie ? [o/n] " input
until [ $input = o ] || [ $input = n ]
do
   read -p "Rediriger la sortie du programme $1 dans le fichier test/$1.sortie ? [o/n] " input
done

if [ $input = o ]
then
    echo -e "\n${PURPLE}===== Redirection de la sortie =====${NC}\n"
    qemu-system-riscv32 -machine cep -bios none -nographic -kernel $1 > test/$1.sortie
    ../common/verif_etud.sh
else
    echo -e "\n${PURPLE}====================${NC}\n"
    exit 0
fi

echo
read -p "Mettre à jour le dépôt distant ? [o/n] " input
until [ $input = o ] || [ $input = n ]
do
   read -p "Mettre à jour le dépot distant ? [o/n] " input
done

if [ $input = o ]
then
    echo -e "\n${PURPLE}===== Mise à jour du dépot distant =====${NC}\n"
    git add fct_$1.s
    git add test/$1.sortie
    git commit -m "$1"
    git push
else
    echo -e "\n${PURPLE}====================${NC}\n"
    exit 0
fi

echo -e "\n${PURPLE}====================${NC}\n"
exit 0
