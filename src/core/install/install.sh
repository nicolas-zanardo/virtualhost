#!/bin/bash

# INFORMATION
# --------------------------------
# If the function receives the variable $SKIP-INSTALL, 
# the installation of the project files is not done

source ./src/core/install/procedure/procedure-choice.sh
source ./src/core/install/procedure/procedure-standar.sh
source ./src/core/install/procedure/procedure-git.sh
source ./src/core/install/choice-techno/techno-choice.sh
source ./src/core/install/choice-techno/techno-print.sh

install() {
    # select techno
    printTechnoTmp $@
    choiceTechno $@

    if [ -z "$SKIP_INSTALL" ]
    then
        # Get varible $STANDARD_PROCESS_INSTALLATION
        choiceProcedureInstall $@

        # Collects variables for each type of installation
        case $PROCESS_INSTALLATION in 
        "standard")
            standardProcedureInstall $@;;
        "git")
            gitProcedureInstall $@;;
        esac

        # Selects the installation of the technology
        source ./src/techno/$TECHNO/$TECHNO.sh
        install_$TECHNO $@

        # Create log Folder
        mkdir ./www/$1/log/
        touch ./www/$1/log/project_error.log
        touch ./www/$1/log/project_access.log

        # add Group www-data
        echo -e "${bold_blue}➲ QUESTION: ${bold_gray}Add Folder $1 in www-data Group${reset}"
        sudo chown -R www-data:www-data ./www/$1/public

        # Symbolic link WWW to $USER
        sudo ln -c $PATH_PROJECT/www/$1 /

        # log access create
        echo [`date -u`] ░▒▓ $1 ▓▒░ ➠ 🕵‍♀ Create by $USER - WITH OPTION : [ $PROCESS_INSTALLATION $URLGITCLONE $STANDARD_PROCESS_INSTALLATION $VERSION ] >> ./log/access.log
    fi
}