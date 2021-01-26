#!/bin/bash

source ./src/shared/validation/valid-operation.sh
source ./src/shared/validation/if-quit-program.sh

# INFORMATION
# --------------------------------
# The purpose of this function is to recover the variables 
# to make the installation either by:
#   - Git
#   - Official documentation

choiceProcedureInstall() {

    while [[ $standardProcesInstallValid != 'y' ]]
    do
        # Message:
        echo ""
        echo -e "${bold_blue}➲ QUESTION:${reset} ${white}Would you prefer to do a ${green}standard${white} installation or by ${red}git${reset}?"
        echo -e "${bright_black}
        * (s)tandrad = new installation official doc      
        * (g)it = with a repository Github/Gitlab/Gitkraken 
        * (q)uit = quit installation                        
        ${reset}"

        # Question to the user
        read -p "tape (s)tandard (g)it (q)uit: " procedureInstall
        # Select Standard installation
        if [[ $procedureInstall == 's' ]]
        then
        	PROCESS_INSTALLATION="standard"
            echo ""
            echo -e "${background_blue}${bold_white}                           ${reset}"
		    echo -e "${background_blue}${bold_white} ✔ ℹ STANDARD installation ${reset}"
		    echo -e "${background_blue}${bold_white}                           ${reset}"
            echo ""
            # User confirms standard procedure
            validOperation standardProcesInstallValid $PROCESS_INSTALLATION
        fi
        # Select Git Installation
        if [[ $procedureInstall == 'g' ]]
        then
        	PROCESS_INSTALLATION="git"
            echo ""
            echo -e "${background_blue}${bold_white}                           ${reset}"
		    echo -e "${background_blue}${bold_white}   ✔ ℹ GIT installation    ${reset}"
		    echo -e "${background_blue}${bold_white}                           ${reset}"
            echo ""
            # User confirms Git procedure
            validOperation standardProcesInstallValid $PROCESS_INSTALLATION
        fi
        # Quit Program
        ifQuitProgram $1 $procedureInstall
    done
}

export -f choiceProcedureInstall