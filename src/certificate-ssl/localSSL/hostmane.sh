#!/bin/bash

hostname(){
    # Delete file techno in folder tmp
    if [ -f ./tmp/hostname ]
    then 
        rm ./tmp/hostname
    fi 
    
    pcName=$(cat /proc/sys/kernel/hostname)
    echo "
#Create by $pcName
# DOMAINE $1
127.0.0.1   www.$1 
127.0.0.1   $1
::1         www.$1
::1         $1
# END
" > ./tmp/hostname
}

export -f hostname