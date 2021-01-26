#!/bin/bash

# INFORMATION
# --------------------------------
# this function allows to list the different ssl certificates
# 

source ./src/core/createSSL/choice-SSL/print-certificate-ssl.sh
source ./src/core/createSSL/choice-SSL/choice-ssl.sh

createSSL() {

    printCertificateSSLTmp
    choiceSSL $@

    mkdir $PATH_PROJECT/certificate/$1

    source ./src/certificate-ssl/$CERTIFICATE_SSL/$CERTIFICATE_SSL.sh

    install_$CERTIFICATE_SSL $@

    

}

export -f createSSL