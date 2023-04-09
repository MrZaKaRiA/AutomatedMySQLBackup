## AutomatedMySQLBackup

Automated MySQL Backup with Rclone Sync:
This script automates the process of backing up MySQL databases on a Debian-based server. It creates a timestamped folder for each backup, compresses the SQL dump files using gzip, and removes backups older than 30 days to save disk space. Additionally, the script syncs the backup folder with a specified cloud storage folder using `rclone`. The example provided is for Dropbox, but `rclone` can be configured to work with various cloud storage providers such as Google Drive, OneDrive, and more.

## Features

- Creates timestamped folders for daily backups
- Compresses SQL dumps using gzip
- Deletes backups older than 30 days
- Syncs backup folder with cloud storage using `rclone`

## Prerequisites

- Debian-based server (e.g., Ubuntu)
- MySQL server and client installed
- Cloud storage account (e.g., Dropbox, Google Drive, etc.)

## Dependencies

- MySQL client (for mysqldump)
- Rclone
- Gzip
- Cron (for scheduling)

## Usage:

Install rclone and configure it for your desired cloud storage provider.
Customize the script by setting the appropriate database credentials and backup folder paths.
Schedule the script to run daily using a cron job.

## Installation

1. Install the required packages:

```bash
sudo apt-get update
sudo apt-get install mysql-client rclone gzip

```
2. Clone this repository:

```bash
git clone https://github.com/MrZaKaRiA/AutomatedMySQLBackup.git

```


3. Make the script executable:

```bash
chmod +x AutomatedMySQLBackup/sql_backup.sh

```


## Configuration

1. Open the `sql_backup.sh` script and set the appropriate database credentials (user and password), backup folder paths, and cloud storage provider information.

2. Schedule the script to run daily using a cron job:

```bash
crontab -e

```

Add the following line at the end of the file:

```bash
0 0 * * * /path/to/AutomatedMySQLBackup/sql_backup.sh

```


3. Configure `rclone` for your desired cloud storage provider by following the [official documentation](https://rclone.org/docs/).


Replace the placeholders with your actual repository URL and file paths.
