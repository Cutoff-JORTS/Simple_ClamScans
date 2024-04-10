Hi there, JORT here!

Thanks for pulling a copy of my simple scan! This repo has everything you need to run clamscan (by clamAV) as "user-friendly" as possible.

	*note* The shell script DOES REQUIRE clamav to run, and the at-will scan script will run a sanity check to verify install before running. The automated script will **not**, so be sure to install clamav before using it.

INSTRUCTIONS:
	1. Populate the targets file with directories you would like to scan. By default, the first entry is set to /home/$(whoami) ...aka the user running the cron job.
	2. *if desired, update the designated log files or target file by editing the script directly. The variables for each are at the top and clearly indicated.
	3. Establish a recurring cron job to run the AVautoscan script