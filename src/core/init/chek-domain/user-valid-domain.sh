#!/bin/bash

# INFORMATION
# --------------------------------
# The user checks to see if he has entered the right domain name

userValidDomain() {
    echo -e "${bold_blue}➲ QUESTION:${reset} ${whit}Do you want validate the domaine name ?${reset} ${green}${underline}https:${reset}${underline}//$1${reset}"

    while [[ $domain != 'y' ]]
    do 
        read -p "Type (y) to validate or (q)uit: " domain
        if [[ $domain == 'q' ]]
        then
        	echo ""
		    echo -e "${background_cyan}${bold_gray} ℹ please tray again ${reset}"
		    echo -e "${bold_gray}➲ EXAMPLE:${reset} ${green}./install mondomaine.local${reset}"
            echo -e "${bright_black}Bye ヅ${reset}"
            echo ""
            exit
        fi
    done
}

export -f userValidDomain