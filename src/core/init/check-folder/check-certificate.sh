#!/bin/bash

# // TODO

checkCertificate() {
    if [ -d ./certificate ]
    then
        echo -e "${green}Folder certificate is ok ✔  ${reset}"
    fi
}

export -f checkCertificate 