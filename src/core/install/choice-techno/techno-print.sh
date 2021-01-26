#!/bin/bash

# INFORMATION
# --------------------------------
# Thanks to this function we will compare the user's choice 
# if it corresponds to a technology list by the printTechnoTmp() 
# function in the print-techno.sh

printTechnoTmp() {

# Delete file techno in folder tmp
if [ -f ./tmp/techno ]
then 
    rm ./tmp/techno
fi 

# Check techno in folder ./src/techno
target="./src/techno/$2"
for file in "$target"/*
do
    echo $(basename $file) | sed s/.sh/""/g >> ./tmp/techno
done

}

export -f printTechnoTmp