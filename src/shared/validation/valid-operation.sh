#!/bin/bash

# INFORMATION
# --------------------------------
# It validates all data entered by the user during while iterations

function validOperation() {

    echo -e "${bold_blue}➲ QUESTION: ${white}Do you want to change? ${bold_purple}▶ $2${reset}"

    read -p "Tap (y) to validate or tap another key to change: " $1
}

export -f validOperation