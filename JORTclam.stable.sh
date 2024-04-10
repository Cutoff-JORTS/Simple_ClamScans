#! /bin/bash

#Name: JORTclam
#Purpose: Simple scan tool (requires clamAV's clamscan)
#Author: jort
#------------------------------------------------------

#Checks to ensure ClamAV is installed. Will instruct user to install & quit on failure.
sanitycheck="$(which clamscan)"
if [ -z "$sanitycheck" ]; then
        echo "please install ClamAV via package manager for $(uname -o). Thank you"
	exit 1
fi


#Basic welcome text/"splash screen"
function Welcome_user(){
clear
echo "Welcome to JORTclam, $(whoami). I am a clunky-yet-functional script to quickly scan directory contents for viruses with rudimentary logging"
echo " "
}

#Define target dir to scan
function Ask_for_target(){
	read -p "Please enter full path to directory to scan: " scan_target
	echo " "
	echo "Thank you. Confirming directory $scan_target"
	echo " "
}

#Define paramters for log files
function Define_log_params(){
	read -p "Please enter the name of your desired log file for this scan:" mylog
		log_file="long_$mylog"
		summary="summary_$mylog"
			touch $log_file $summary
			echo "Scan run by: $(whoami) on $(date)" > $log_file
			echo "---------------------------------------------" >> $log_file

	echo "Thank you. Your log file will be available in $(pwd) following exit of this command."
}

#Commence the scanning!
function Scan_the_things(){
	echo "For your convenience, this script will display a summary of the results on-screen upon completion."

	sleep 1

	sudo clamscan -o -i --bell --alert-broken-media=yes -r -l $log_file $scan_target
}

#Everybody likes legible logs
function Cleanup_logs(){
	head -n 2 $log_file > $summary
	tail -n 12 $log_file >> $summary

	echo "your full logs are located at:"
	echo "-- Detail Log:$(pwd)/$log_file"
	echo "-- Summary:$(pwd)/$summary"
}

Welcome_user
sleep .5
Ask_for_target
sleep .5
Define_log_params
sleep .5
Scan_the_things
Cleanup_logs
