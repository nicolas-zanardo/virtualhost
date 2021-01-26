#!/bin/bash

# INFORMATION
# --------------------------------
# this function allows to list the different ssl certificates

choiceSSL() {
    # Message:
    echo -e "${bright_yellow}"
    echo -e "---------------------"
    echo -e "-  CERTIFICATE SSL  -"
    echo -e "---------------------${reset}"
    # print the list of certificates-ssl in folder ./tpm 
    for line in $(cat ./tmp/certificateSSL); 
    do 
        echo -e "${bright_black}➠${reset} $line"; 
    done
    # user choice a Certificate
    echo ""
    echo -e "${bold_blue}➲ QUESTION:${reset} ${bright_white}Which of the Certificate you want in the list above?${reset}"
    while [ -z $certificate ] || [ $certificate != 'q' ]
    do
        read -p "Choice a technology or (q) to quit: " certificate 
        # User quits program
        if [[ $certificate == 'q' ]]
        then
           ifQuitProgram $1 $certificate
        else
            # In this loop I compare whether the 
            # inflow value corresponds to a value 
            # in the tmp/certificateSSL that contains all 
            # the available certificateSSL created by 
            # the choicecertificate() function in the 
            # file choice-certificate-ssl.sh    
            for line in $(cat ./tmp/certificateSSL);
            do 
                if [[ $line == $certificate ]]
                then
                    CERTIFICATE_SSL=$certificate
                    break 3
                fi
            done
        fi
    done
}

export -f choiceSSL