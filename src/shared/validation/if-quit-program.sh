#!/bin/bash

# INFORMATION 
# ----------------------------------------------------------------
# Block being part of an iterative structure [if] to get out of the program

function ifQuitProgram() {
    if [[ $2 == 'q' ]]
    then
        echo [`date -u`] ░▒▓ $1 ▓▒░ ➠ 🕵‍♀ Program left by $USER >> ./log/access.log
        echo ""
        echo -e "${bright_black}Bye ヅ${reset}"
        echo ""
        exit
    fi
}

export -f ifQuitProgram