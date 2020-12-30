#!/bin/bash
# backup_dirs_to_tars.sh - back up directories in $backupdir to 
# individual tars in $outputdir
# NB ignores .hidden (dotted) directories
DATE=$(TZ=Africa/Cairo date +%d-%m-%Y-%T)
backupdir=/opt
outputdir=/home/ubuntu/Backups2020/tomcatbackup

cd $backupdir

for dir in */; do
       sudo tar -cf "$outputdir/$(basename $dir)-$DATE.tar" "$dir"
       sudo find $outputdir -mtime +10 -type f -delete
       sudo find $outputdir -mmin +1 -type f ! -name '*.sh' -delete
done

