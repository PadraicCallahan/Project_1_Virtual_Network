#!/bin/bash
free -m | awk 'NR==3{print $4}' > ~/Projects/backups/freemem/free_mem.txt
df -h --output=source,size > ~/Projects/backups/diskuse/disk_usage.txt
lsof | awk '{print $1}' > ~/Projects/backups/openlist/open_list.txt
df -h > ~/Projects/backups/freedisk/free_disk.txt
