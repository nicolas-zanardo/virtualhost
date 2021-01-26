#!/bin/bash

createConf() {
   for line in $(cat ./config/Constants/.const)
   do
    
    if [ PATH_PROJECT == $line ]
    then
        echo "$line=$PWD" >> ./.env; 
        continue
    fi

    if [ MYSQL_VERSION == $line ]
    then
        echo ""
        echo -e "${bold_red}➲ INFO:${reset} To know the version of mysql enter this command: 
            ${cyan}mysql --version${reset}" 
    fi

    if [ POSTGRESQL_VERSION == $line ]
    then
        echo ""
        echo -e "${bold_red}➲ INFO:${reset} To know the version of posgeSQL enter this command: 
            ${cyan}sudo -u postgres psql
            SELECT version();${reset}" 
    fi


    echo $line | sed 's/=.*/''/' > ./tmp/var.env
    constENV=$(cat ./tmp/var.env)
    echo $line | sed 's/.*=/''/' > ./tmp/value.env
    constValue=$(cat ./tmp/value.env)

    if [[ $constValue == $constENV ]]
    then
        echo ""
        echo -e "${bold_blue}➲ Question: ${yellow}$constENV${red} is empty:${reset}"

        read -p "Enter a new value: " enterConst 
        echo -e "${white}$constENV${reset}=${purple}$enterConst${reset}"
        echo "$constENV=$enterConst" >> ./.env;
    else
        echo -e ""
        echo -e "${bold_blue}➲ INFO: ${yellow}$constENV${reset} default value is: ${purple}$constValue${reset}"

        read -p "tape (y) for valid $constValue or enter a new value: " enterConst

        if [[ $enterConst == 'y' ]]
        then
            echo -e "${white}$constENV${reset}=${purple}$constValue${reset}"
            echo "$constENV=$constValue" >> ./.env;
        elif [[ $enterConst == '' ]]
        then
            echo -e "${white}$constENV${reset}=${purple}$constValue${reset}"
            echo "$constENV=$constValue" >> ./.env;
        else
            echo -e "${white}$constENV${reset}=${purple}$enterConst${reset}"
            echo "$constENV=$enterConst" >> ./.env;
        fi
    fi
   done
}
export -f createConf

