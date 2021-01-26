#!/bin/bash

# INFORMATION
# --------------------------------
# Thanks to this function we will compare the user's choice 
# if it corresponds to a certificate-ssl list by the printCertificatSSLTmp() 
# function in the print-certificat-ssl.sh



printCertificateSSLTmp() {
   # Delete file techno in folder tmp
    if [ -f ./tmp/certificateSSL ]
    then 
        rm ./tmp/certificateSSL
    fi  

    # Check techno in folder ./src/techno
    target="./src/certificate-ssl/$2"
    for file in "$target"/*
    do
        echo $(basename $file) | sed s/.sh/""/g >> ./tmp/certificateSSL
    done
}