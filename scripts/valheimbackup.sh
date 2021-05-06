#!/bin/bash

## Get the current date as variable.
TODAY="$(date +%Y-%m-%d)"

## Clean up files older than 2 weeks. Create a new backup.
find /home/steam/backups/ -mtime +14 -type f -delete

systemctl stop valheimserver.service

#Wait for RAM to offload to .db and .db.old
#allows for the closing of the databases.
sleep 10

## Tar Section. Create a backup file, with the current date in its name.
## Add -h to convert the symbolic links into a regular files.
## Backup some system files, also the entire `/home` directory, etc.
## --exclude some directories, for example the the browser's cache, `.bash_history`, etc.
tar zcvf "/home/steam/backups/valheim-backup-$TODAY.tgz" /home/steam/.config/unity3d/IronGate/Valheim/worlds/* 
chown steam:steam /home/steam/backups/valheim-backup-$TODAY.tgz