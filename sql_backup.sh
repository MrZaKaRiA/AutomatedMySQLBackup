#!/bin/bash

# Set variables
USER="your_database_user"
PASSWORD="your_database_password"
OUTPUT="/path/to/backup"

# Create timestamped folder for backup
DATE=$(date +%Y-%m-%d_%H%M%S)
mkdir -p $OUTPUT/$DATE

# Backup all databases and compress
databases=$(mysql -u $USER -p$PASSWORD -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema)")

for db in $databases; do
  mysqldump -u $USER -p$PASSWORD --databases $db | gzip > "$OUTPUT/$DATE/$db.sql.gz"
done

# Delete backups older than 30 days
find $OUTPUT -type d -mtime +30 -exec rm -rf {} \;

# Upload backups to cloud storage
rclone sync -P $OUTPUT your_remote:/your_cloud_storage_folder
