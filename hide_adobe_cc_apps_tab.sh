#!/bin/bash


# Check if the ServiceConfig.xml file exists
if [ -e /Library/Application\ Support/Adobe/OOBE/Configs/ServiceConfig.xml ]; then

	# If it exists, check if it contains "true"
	if grep -q "true" /Library/Application\ Support/Adobe/OOBE/Configs/ServiceConfig.xml; then

		# The file contains "true" and needs to be edited to "false"

		echo "ServiceConfig.xml file exists and Apps tab is SHOWING."
		echo "Changing ServiceConfig.xml file from TRUE to FALSE."

		# Change ServiceConfig.xml file from "true" to "false"
		sed -i.bak s/true/false/g /Library/Application\ Support/Adobe/OOBE/Configs/ServiceConfig.xml

		# Searches for Creative Cloud Process IDs and closes them
		echo "Killing Creative Cloud PIDs:$(ps aux | grep 'Creative\ Cloud' | awk '{print $2}')"
		kill $(ps aux | grep 'Creative\ Cloud' | awk '{print $2}')

		# Searches for Adobe Desktop Service Process IDs and closes them
		echo "Killing Adobe Desktop Service PIDs:$(ps aux | grep 'Adobe\ Desktop\ Service' | awk '{print $2}')"
		kill $(ps aux | grep 'Adobe\ Desktop\ Service' | awk '{print $2}')

		# Waits 5 seconds to give the computer time to close out the processes
		sleep 5

		# Reopen Creative Cloud Desktop app with the current user

		echo "Reopening Creative Cloud Desktop App"

		# Grabs the current user
		user=`ls -la /dev/console | cut -d " " -f 4`

		# Open Creative Cloud
		sudo -u $user open -a Creative\ Cloud

	else

		# Output that it does say "false" and end script
		echo "ServiceConfig.xml file exists and Apps tab is HIDDEN."

	fi

else

	# If the ServiceConfig.xml file does not exist, create the XML file and set it to "false"

	echo "ServiceConfig.xml file does not exist. Creating XML file and setting it to FALSE."

	# Creates Configs directory and ServiceConfig.xml file
	mkdir /Library/Application\ Support/Adobe/OOBE/Configs/
	touch /Library/Application\ Support/Adobe/OOBE/Configs/ServiceConfig.xml
	echo "<config><panel><name>AppsPanel</name><visible>false</visible></panel></config>" > /Library/Application\ Support/Adobe/OOBE/Configs/ServiceConfig.xml

	# Searches for Creative Cloud Process IDs and closes them
	echo "Killing Creative Cloud PIDs:$(ps aux | grep 'Creative\ Cloud' | awk '{print $2}')"
	kill $(ps aux | grep 'Creative\ Cloud' | awk '{print $2}')

	# Searches for Adobe Desktop Service Process IDs and closes them
	echo "Killing Adobe Desktop Service PIDs:$(ps aux | grep 'Adobe\ Desktop\ Service' | awk '{print $2}')"
	kill $(ps aux | grep 'Adobe\ Desktop\ Service' | awk '{print $2}')

	# Waits 5 seconds to give the computer time to close out the processes
	sleep 5

	# Reopen Creative Cloud Desktop app with the current user

	echo "Reopening Creative Cloud Desktop App"

	# Grabs the current user
	user=`ls -la /dev/console | cut -d " " -f 4`

	# Open Creative Cloud
	sudo -u $user open -a Creative\ Cloud

fi
