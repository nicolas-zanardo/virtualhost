#!/bin/bash

# INFORMATION
# --------------------------------
# Check the valid domain name past in argument $1
# Ex : my-domaine.com

domainArgument() {
	validDomain="^(([a-z0-9])+(-?)([a-z0-9]+))+[.][a-z]+$"
	if [[ $1 =~ $validDomain  ]]
	then
		echo ""
		echo -e "${background_green}${bold_gray}✔ ok ${reset} ${green}The domain name is correct${reset}"
		echo -e "${bright_black}Domain:${reset} ${bright_bold_purple}$1${reset}"
		echo ""
	else
		echo ""
	 	echo -e "${background_yellow}${bold_gray}                      ${reset}"
		echo -e "${background_yellow}${bold_gray} ⚠ !!! WARNING !!! ⚠  ${reset}"
		echo -e "${background_yellow}${bold_gray}                      ${reset}"
		echo -e "${red}The domain name is not correct${reset}"
        echo -e "${bright_black}You have input:${reset} $1"
        echo -e "${bright_black}example:${reset} ${green}mondomaine.local${reset}"
		echo ""
		echo -e "${background_cyan}${bold_gray} ℹ playse tray again ${reset}"
		echo -e "${bright_black}➲ example:${reset} ${green}./main mondomaine.local${reset}"
		echo ""

		exit
	fi
}

export -f domainArgument