#!/bin/bash

source ./src/core/init/init.sh
source ./src/core/install/install.sh
source ./src/core/createSSL/create-SSL.sh

app(){

init $@
install $@
createSSL $@

}

export -f app