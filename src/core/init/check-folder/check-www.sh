#!/bin/bash

# INFORMATION 
# --------------------------------
# Checks if the www folder still exists, if it doesn't exist 
# it sends back an error message and recreates the folder

source ./src/shared/messages/danger.sh

checkWWW() {
if [  -z "$1" ]
then
    if [ -d ./www ]
    then
        echo ""
    	echo -e "${green}Folder www is ok ✔  ${reset}"
    else
        if [ -f ./log/access.log ]
        then
            messageDanger
            echo -e "${bright_black}Your ./www folder was deleted by mistake, we recreated another one ${reset}"
            echo ""
            mkdir ./www
            # log access
            echo [`date -u`] ░▒▓ $1 ▓▒░ ➠ 🕵‍♀ Create ./www by $USER  >> ./log/access.log
        else
            echo ""
            echo -e "${background_black}             ⚠ First creation Domaine name ⚠              ${reset}"
            echo -e "${white}        Make sure this is the first time you've created" 
            echo -e "${bold_blue}➲ INFO: ${white}a Virtual host with the program or that" 
            echo -e "${white}        you haven't renamed the folder${reset}"
            echo -e "${background_black}  ⚠ The www folder does not exist and you have no log ⚠   ${reset}"
            echo ""
            mkdir www
    	    echo -e "${green}The www folder was created ok ✔${reset}"
        fi
    fi
fi

if [  -n "$1" ]
then
    if [ -d ./www/$1 ]
    then 
        # Message:
        messageDanger
        echo -e "${bright_black}Your ./www/$1 existe${reset}"
        echo ""
        while [[ $confirmRecreateProject != 'n' ]]
        do  
            # Message:
            echo ""
            echo -e "${bold_blue}➲ QUESTION: ${bold_red}Do you want to remouve the folder?${reset}?"
            # Message option
            echo -e "${bright_black}
            * (r)emouve  = Remouve the folder
            * (n)o       = continue
            * (q)uit     = quit and exit program
            ${reset}"
            # Question to the user
            read -p "tape (n)o, (r)remouve, (q)uit: " confirmRecreateProject
            if [ $confirmRecreateProject == 'r' ]
            then
                # log Remove
                echo [`date -u`] ░▒▓ $1 ▓▒░ ➠ 🕵‍♀ Removed by $USER  >> ./log/remove.log
                # Delete Folder
                sudo rm -rf ./www/$1
                break
            fi
            if [ $confirmRecreateProject == 'n' ]
            then
                SKIP_INSTALL=true
            fi
            ifQuitProgram $1 $confirmRecreateProject
        done
    else
       echo -e "${green}The ${yellow}$1${green} project was never created ✔ ${reset}" 
    fi
fi 

}

export -f checkWWW