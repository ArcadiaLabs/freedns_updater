# freedns_updater
Bash script to update freedns record if a new public IP is detected

Only updates record if a new IP has been found

# How to use
- Edit the script variables DOMAIN, USER, PASSWORD with your own
- Put the script in a folder
- Run the script every minute with 

`sudo crontab -e`

add this line at end of the file :

`* * * * * sudo sh [FOLDER]/freedns_update_ip.sh` (remplace [FOLDER] with your own)

# Logging
The scripts writes in a log if the IP has been updated. The log is located at `/tmp/freedns.log`

The log is in tmp folder so it will reset after a reboot.
