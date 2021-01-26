#!/bin/bash

checkFolder() {
    if [ -d ./$1 ]
    then
        echo -e "${green}Folder $1 is ok ✔${reset}"
    else
        echo -e "${yellow}Create folder $1${reset}"
        mkdir $1
    fi
}

export -f checkFolder