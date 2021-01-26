#!/bin/bash

# INFORMATION 
# --------------------------------
# Message Danger 

messageDanger() {
    echo ""
    echo -e "${background_red}                      ${reset}"
    echo -e "${background_red}${bold_white}  ⚠ !!! DANGER !!! ⚠  ${reset}"
    echo -e "${background_red}                      ${reset}"   
    echo "" 
}

export -f messageDanger