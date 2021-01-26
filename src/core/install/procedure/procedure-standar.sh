#!/bin/bash

source ./src/shared/validation/valid-operation.sh
source ./src/shared/validation/if-quit-program.sh

standardProcedureInstall() {
   
    # Choice type installation API/microservice or webApp
    while [[ $standardProcedureInstallValid != 'y' ]]
    do
        # Message:
        echo ""
        echo -e "${bold_blue}➲ QUESTION: ${white}How are you going to use it:${reset} as an ${bold_yellow}api/micro-service ${reset}or for ${bold_yellow}web application?${reset}"
        echo -e "${bright_black}
        * (s)erver = Micro-service/api
        * (w)eb = app web
        * (q)uit = Exit program
        ${reset}"
        
        # Question
        read -p "tape (s)erver (w)eb (q)uit: " standardProcesInstall
        # Option configuration server
        if [[ $standardProcesInstall == 's' ]]
        then
            STANDARD_PROCESS_INSTALLATION="server"
            echo ""
            echo -e "${background_bright_black}${bold_white}                        ${reset}"
            echo -e "${background_bright_black}${bold_white} ▶ Server installation  ${reset}"
            echo -e "${background_bright_black}${bold_white}                        ${reset}"
            echo ""
            validOperation standardProcedureInstallValid $STANDARD_PROCESS_INSTALLATION
        fi
        # Option configuration web
        if [[ $standardProcesInstall == 'w' ]]
        then
            STANDARD_PROCESS_INSTALLATION="web"
            echo ""
            echo -e "${background_bright_black}${bold_white}                        ${reset}"
            echo -e "${background_bright_black}${bold_white} ▶ Web installation     ${reset}"
            echo -e "${background_bright_black}${bold_white}                        ${reset}"
            echo ""
            validOperation standardProcedureInstallValid $STANDARD_PROCESS_INSTALLATION
        fi
        # Procedure validation message
        ifQuitProgram $1 $standardProcesInstall
    done

    # choose to install the version
    while [[ $standardVersionValid != 'y' ]]
    do
        # Message:
        echo ""
        echo -e "${bold_blue}➲ QUESTION:${reset} ${white}Do you need to specify the installation ${purple}version${reset}?"
        # Message option
        echo -e "${bright_black}
        * ^4.4 = vesion ^4.4
        * (q)uit = quit and exit program
        ${reset}"

        # Question to the user
        read -p "tape a number or (q)uit: " standardVersionInstall
        # Number value
        if [[ $standardVersionInstall =~ [0-9.^]+ ]]
        then
            VERSION=$standardVersionInstall 
            echo ""
            echo -e "${background_purple}${bold_white} ▶ $VERSION  ${reset}"
            echo ""
            validOperation standardVersionValid $VERSION
        fi
        # Quit Program
        ifQuitProgram $1 $standardVersionInstall
    done
}

export -f standardProcedureInstall