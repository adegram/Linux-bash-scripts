# Backup Automation

A lightweight Bash utility for creating **timestamped, compressed backups** with **SHA-256 integrity verification**.

## Features

* Validates source and destination paths
* Prevents backups from being created inside the source directory
* Creates timestamped `.tar.gz` archives
* Generates SHA-256 checksums
* Preserves the original source data

## Usage

```bash
chmod +x backup.sh

./backup.sh /path/to/source /path/to/backup-directory
```

Example:

```bash
./backup.sh ~/Documents ~/Backups
```

The script produces:

```text
Documents-20260925-021500.tar.gz
Documents-20260925-021500.tar.gz.sha256
```

## Verify Backup

```bash
sha256sum -c ~/Backups/Documents-20260925-021500.tar.gz.sha256
```

Expected result:

```text
Documents-20260925-021500.tar.gz: OK
```

## Project Structure

```text
backup-automation/
├── backup.sh
├── README.md
└── IMPLEMENTATION.md
```

## Future Improvements

* Automated retention and cleanup
* `cron` / `systemd` scheduling
* Backup encryption
* Remote/cloud storage
* Automated restore testing
* Monitoring and notifications

## Purpose

A practical Linux/DevOps project demonstrating **Bash scripting, filesystem operations, defensive scripting, backup automation, and data integrity verification**.
