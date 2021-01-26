#!/bin/bash

# INFORMATION
# --------------------------------
# list all available techniques

choiceTechno() {
    echo -e "${bright_yellow}"
    echo -e "---------------------"
    echo -e "- CATEGORIES TECHNO -"
    echo -e "---------------------${reset}"
    # print the list of technologies in folder ./tpm 
    for line in $(cat ./tmp/techno); 
    do 
        echo -e "${bright_black}➠${reset} $line"; 
    done
    # user choice a technology
    echo ""
    echo -e "${bold_blue}➲ QUESTION:${reset} ${bright_white}Which of the technologies you want in the list above?${reset}"
    while [ -z $techno ] || [ $techno != 'q' ]
    do
        read -p "Choice a technology or (q) to quit: " techno 
        # User quits program
        if [[ $techno == 'q' ]]
        then
           ifQuitProgram $1 $techno
        else
            # In this loop I compare whether the 
            # inflow value corresponds to a value 
            # in the tmp/techno that contains all 
            # the available techno created by 
            # the choiceTechno() function in the 
            # file choice-techno.sh    
            for line in $(cat ./tmp/techno);
            do 
                if [[ $line == $techno ]]
                then
                    TECHNO=$techno
                    break 3
                fi
            done
        fi
    done
}


export -f choiceTechno