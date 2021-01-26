#!/bin/bash

source ./src/validation/shared/if-quit-program.sh

install_symfony() {

   case $PROCESS_INSTALLATION in
   "standard")
      while [[ $composerOrBinary != 'q' ]]
      do        
         # Message:
         echo ""
         echo -e "${bold_blue}➲ QUESTION: ${white}Do you prefer to use composer or symfony?${reset}"
         # Message option
         echo -e "${bright_black}
         * (c)omposer = Install by composer (prod Debian10 Buster)
         * (b)inary   = Install by symfony (dev)
         * (q)uit     = quit and exit program
         ${reset}"

         # Question to the user
         read -p "tape (c)omposer (b)inary (q)uit: " composerOrBinary
         if [[ $composerOrBinary == 'c' ]]
         then
            # Changing the web variable to compose
            if [[ $STANDARD_PROCESS_INSTALLATION == "web" ]]
            then
               full="-skeleton"
            fi
            # Installation composer
            composer create-project symfony/website$full:"$VERSION" ./www/$1            
            break
         fi

         if [[ $composerOrBinary == 'b' ]]
         then
            if [[ $STANDARD_PROCESS_INSTALLATION == "web" ]]
            then
               full="--full"
            fi

            symfony new ./www/$1 $full --version=$VERSION         
            break
         fi

         ifQuitProgram $composerOrBinary
      done;;
   "git")
      git clone $URLGITCLONE ./www/$1
   esac
}