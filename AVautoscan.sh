#! /bin/bash

scan_list='~/'
log_file='~/AVscan.log'
summary='~/AVsummary.log'

#confirm logs exist, overwrite old data
	touch $log_file $summary
		echo "Last scanned on $(date)" > $log_file
		echo "---------------------------------------------" >> $log_file
		echo "Directories scanned include: " >> $log_file
		echo " "
		echo "$(cat $scan_list)" >> $log_file
		echo "---------------------------------------------" >> $log_file
		echo " " >> $log_file
		echo "List of target directories can be found here: $scan_list" >> $log_file
		echo "---------------------------------------------" >> $log_file

#Scan the target list, write to log
clamscan -i -o -r -l $log_file -f $scan_list

#clip last run by & date/time run + summary section of scan from full log
	head -n 2 $log_file > $summary
	tail -n 12 $log_file >> $summary
