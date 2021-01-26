#!/bin/bash

# INFORMATION
# --------------------------------
# Create Seldf-certificateSLL

install_localSSL() {
    # Check folder certificate
    if [[ -d $PATH_PROJECT/certificate  ]]
    then
        echo -e "${green}Folder certificate is ok ✔  ${reset}"
    else
        echo -e "${red}The certificate folder is deleted${reset}"
        mkdir $PATH_PROJECT/certificate/$1
    fi

    # Check folder $1
    if [[ -d $PATH_PROJECT/certificate/$1  ]]
    then
        rm  $PATH_PROJECT/certificate/$1
    else
        mkdir $PATH_PROJECT/certificate/$1
    fi


    # Check DNS Exists
    findDNS=$(grep -E 'DNS.[[:digit:]] = '$1  $PATH_PROJECT/certificate/_localSSL/local.ext)
    if [[ -n $findDNS ]]
    then
        # Message
        echo "The project already exists"
        
        # Removes the old tmp/lineDNS file
        if [[ -d ./tmp/ligneDNS  ]]
        then
            rm ./tmp/ligneDNS
        fi

        # Selects all similar lines
        ligneDNS=$(grep -n 'DNS.[[:digit:]] = '$1  $PATH_PROJECT/certificate/_localSSL/local.ext | sed 's/:.*/''/g') 
        # Add result in files tmp/ligneDNS
        echo $ligneDNS >> ./tmp/ligneDNS

        # Percite values
        arrVar=()
        for line in $(cat ./tmp/ligneDNS); 
        do 
            arrVar[${#arrVar[@]}]="$line"  
        done
        # Reverse loop to erase similar DNS
        for (( idx=${#arrVar[@]}-1 ; idx>=0 ; idx-- )) ; do
            sed -i.bak ${arrVar[idx]}'d' ./certificate/_localSSL/local.ext
        done
        # Delete similair folder
        rm ./certificate/$1
    fi

    # install certificate
    openssl genrsa -des3 -out $PATH_PROJECT/certificate/$1/myCA.key 4096
    openssl req -x509 -new -nodes -key $PATH_PROJECT/certificate/$1/myCA.key -sha256 -days 1825 -out $PATH_PROJECT/certificate/$1/myCA.pem
    openssl genrsa -out $PATH_PROJECT/certificate/$1/local.key
    openssl req -new -key $PATH_PROJECT/certificate/$1/local.key -out $PATH_PROJECT/certificate/$1/local.csr


    testDNS=$(grep DNS $PATH_PROJECT/certificate/_localSSL/local.ext | sed 's/[a-Z. =]/''/g')

    if [[ -z $testDNS ]]
    then 
        echo "DNS.1 = $1" >> $PATH_PROJECT/certificate/_localSSL/local.ext
    else
        DNS=$(tail -n 1  /home/niko/WORKDIR/Scripts/app/virtualhost/certificate/_localSSL/local.ext | sed -e 's/DNS./''/' -e 's/=.*/''/' -e 's/ /''/')
        count=$(expr $DNS + 1)
        echo "DNS.$count = $1" >> $PATH_PROJECT/certificate/_localSSL/local.ext
    fi

    openssl x509 -req -in $PATH_PROJECT/certificate/$1/local.csr -CA $PATH_PROJECT/certificate/$1/myCA.pem -CAkey $PATH_PROJECT/certificate/$1/myCA.key -CAcreateserial -out $PATH_PROJECT/certificate/$1/local.crt -days 1825 -sha256 -extfile $PATH_PROJECT/certificate/_localSSL/local.ext
}

export -f install_localSSL