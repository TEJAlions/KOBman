#!/bin/bash

#Assigning the path variable
$KOBMAN_DIR="~/.kobman/"
_kob_candidate_folder=${KOBMAN_DIR}/candidates # pointouts to the candidates folder
#Mvoing to home directory
cd ~/
# creating a new variable to check the status of the installation
check="true"
__KOB__install()
{	echo "=========================Installing KOBMAN ========================= "
	curl -L https://raw.githubusercontent.com/EtricKombat/KOBman/master/get.kobman.io | bash
	source "/$KOBMAN_DIR/bin/kobman-init.sh"
	
	echo "=========================Install Completed ========================= "
	echo "=========================Checking KOB========================= "
	command="-help -install -list -main -status -uninstall -utils -version" #variable that denotes the necessary commands to verify kobman is installed correctly or not.
	cd ~/
	#sudo rm -rv .kobman/src/kobman-install.sh
	#checking all the files are exixts in the directory or not.
	for i in $command
	do
		FILE=~/.kobman/src/kobman${i}.sh
		if [ -f "$FILE" ]; then
		    echo "$FILE exist"
		else 
		    echo "$FILE does not exist"
			# even if one file is missing kobman cant run completely.. so set check to false
			check="false"			
		fi
	done
	#checking for kobman-init.sh file.
	FILE=~/.kobman/bin/kobman-init.sh
	if [ -f "$FILE" ]; then
		    figlet "$FILE exist"
		else 
		    figlet "$FILE 
		    	does not exist"
			check="false"			
		fi
}

#checking for kobman is already installed or not.
if ls -a | grep .kobman
	then	
		echo "=========================REMOVING KOBMAN========================= "
		
		sudo rm -rv .kobman
		__KOB__install			
	else
		__KOB__install
fi

	#checking for the kobman is fully installed or not.
	if [ $check = "false" ]
        then
                echo " KOBMAN installation is unsucessful............ please try to install again."
        else
                echo "=========================Installation Sucessful========================="
fi
# variable which contains all the envirornment names that a user can install.
envi="greenlight von-network TheOrgBook"

echo "===================installing tobvon==================="
	kob install --dev tobvon       
echo "===================installing tob==================="
	kob install --dev tob
echo "===================installing Greenloght==================="
	kob install --dev greenlight
echo "===================installing kobvon==================="
	kob install --dev kobvon
echo "===================installing kob==================="
	kob install --dev kob
echo "===================installing kobflow==================="
	kob install --dev kobdflow
echo "===================installing kobconnect==================="
	kob install --dev kobconnect
echo "===================installing kobregistory ==================="
	kob install --dev kobregistory
	
	# checking for the envirornments are sucesfully installed or not.
	for i in $envi
	do
	#sudo su
	cd $_kob_candidate_folder
	if [ -d "${i}" ];then
		echo "======================exist ======================"
		figlet $i
	else 
	    echo "====================== does not exist ======================"
	    figlet $i
					
	fi
	done

exit
