#!/bin/bash

source ./src/shared/validation/valid-operation.sh

gitProcedureInstall() {
    
    while [[ $urlGitCloneValid != 'y' ]]
    do
        echo ""
        echo -e "${bold_blue}➲ QUESTION:${reset} ${white}What is your url git clone?${reset}"
        read -p "Enter your url git clone: " URLGITCLONE
        echo ""
        echo -e "${bright_bold_purple}░▒▓ ➠ URL git:${reset} ${bright_black}${underline}$URLGITCLONE${reset}"
        # User validation of git url
        validOperation urlGitCloneValid $URLGITCLONE
    done
}

export -f gitProcedureInstall