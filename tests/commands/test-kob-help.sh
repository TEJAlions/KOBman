#!/bin/bash
#if [ -z "$KOBMAN_DIR" ]; then
#	export KOBMAN_DIR="~/.kobman/"
#fi
#ls -a > list.txt

#Assigning the path variable
$KOBMAN_DIR="~/.kobman/"

#Mvoing to home directory
cd ~/

#Checking if KOBman is already installed, if yes remove and resinstall, if no install
if ls -a | grep .kobman
#if .kobman found
	then
		sudo figlet REMOVING 
		sudo figlet KOBMAN 
		sudo rm -rv .kobman
		sudo figlet INSTALLING
		sudo figlet KOBMAN 
		curl -L https://raw.githubusercontent.com/EtricKombat/KOBman/master/get.kobman.io | bash
		#sudo rm -rv .kobman/src/kobman-help.sh
		source "/$KOBMAN_DIR/bin/kobman-init.sh"

#if .kobman not found	
	else
		curl -L https://raw.githubusercontent.com/EtricKombat/KOBman/master/get.kobman.io | bash
		#sudo rm -rv .kobman/src/kobman-help.sh
		source "/$KOBMAN_DIR/bin/kobman-init.sh"
fi
#kob help > help.txt

#testing help command for pattern matching
if kob help | grep -x "Usage: kob <command> [environment] 

   commands:
       install   or i    [--dev] <environment> [namespace]
       uninstall or rm   <environment> <version>
       list      or ls   [environment]
       version   or v
       status or s
       help      or h

   environment  :  the KOB to install: tob,tobvon,greenlight.. etc.
                 use list command for comprehensive list of environments
                 eg: $ kob list
   --dev        :for setting up development environment
   --deploy     :for deploying specific environment
                 eg: $ kob --dev install tobvon
   namespace    :  you can use this for setup dev env from you forked version
                 eg: $ kob install --dev tobvon hyperledgerkochi
"
	then
#if pattern matched 
		sudo figlet SUCCESS 

#if pattern doesnt match
	else
		sudo figlet FAIL 

fi
#sudo rm help.txt
#sudo rm list.txt
exit


