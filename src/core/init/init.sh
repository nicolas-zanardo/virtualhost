#!/bin/bash

# INFORMATION
# --------------------------------
# This function consists of starting the application on 
# the need necessary for its operation

source ./src/core/init/check-folder/check-www.sh
source ./src/core/init/check-folder/check-certificate.sh
source ./src/core/init/check-folder/check-folder.sh
source ./src/core/init/chek-domain/argument-valid-domain.sh
source ./src/core/init/chek-domain/user-valid-domain.sh

init() {
    # Regex domain name
    domainArgument $@

    # Validation bu $USER
    userValidDomain $@

    # Check folder www if exists
    checkWWW

    # create Folder for install technology
    checkWWW $1

    # Create folder log
    logFolder="./log"
    checkFolder $logFolder

    # Delete file techno in folder tmp
    tmpFolder=./tmp
    checkFolder $tmpFolder


    # check certificate ssl 
    checkCertificate

    # log access 
    echo [`date -u`] ░▒▓ $1 ▓▒░ ➠ 🕵‍♀ $USER access >> ./log/access.log
}

export -f init