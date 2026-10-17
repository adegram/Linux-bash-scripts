# Server Health Check Script

## Overview

The `server-health-check.sh` script is a Bash-based server monitoring utility designed to help DevOps engineers assess the health of a Linux server. It collects key system metrics, identifies potential resource issues, and reports failed systemd services.

The script provides a quick overview of server performance and helps identify problems before they affect application availability.

## Features

- **System information:** Displays the hostname and report timestamp.
- **CPU load and uptime:** Reports system uptime and load averages.
- **Memory monitoring:** Displays memory usage and warns when memory utilization reaches the configured threshold.
- **Disk monitoring:** Lists mounted filesystems and warns when disk usage reaches the configured threshold.
- **Service health checks:** Lists failed systemd services when `systemctl` is available.
- **Configurable thresholds:** Allows memory and disk usage warning thresholds to be customized through environment variables.
- **Error handling:** Uses strict Bash options to catch common scripting errors and validates required commands.

## Prerequisites

- A Linux environment with Bash.
- `df` and `awk` commands.
- `hostname`, `date`, and `uptime` for the complete report.
- `free` for memory usage calculations.
- `systemctl` for failed systemd service reporting.

The script skips memory percentage checks if `free` is unavailable and skips service reporting if `systemctl` is unavailable.

## Usage

### 1. Make the script executable

```bash
chmod +x server-health-check.sh
```

### 2. Run the script

```bash
./server-health-check.sh
```

### 3. Customize warning thresholds

The default disk usage threshold is 85%, and the default memory usage threshold is 90%.

To customize them:

```bash
DISK_THRESHOLD=80 MEMORY_THRESHOLD=85 ./server-health-check.sh
```

The script prints warnings when disk or memory usage meets or exceeds the configured thresholds.

## Sample Output

```text
=== Server Health Report ===
Host: production-server
Time: 2026-10-17T18:30:00+01:00

-- Uptime/load --
18:30:00 up 12 days, 4 hours, 2 users, load average: 0.25, 0.18, 0.12

-- Memory --
               total        used        free
Mem:            7.6Gi       4.1Gi       1.2Gi

-- Filesystems --
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        50G   42G    8G  84% /

-- Failed systemd services (if systemctl exists) --
```

*Note: Output varies depending on the server's resources, operating system, and service status.*

## DevOps Use Cases

- Performing routine Linux server health checks.
- Troubleshooting high memory or disk utilization.
- Investigating server performance issues.
- Identifying failed systemd services.
- Running periodic checks through cron or a systemd timer.
- Collecting basic operational information during incident response.

## Automation Example

To run the health check every day at 8:00 AM using cron:

```cron
0 8 * * * /path/to/server-health-check.sh >> /var/log/server-health-check.log 2>&1
```

Ensure the script path and log-file permissions are correct for the user running the scheduled job.

## Limitations

- CPU load averages are reported, but CPU utilization is not calculated as a percentage.
- Threshold violations produce warning messages but do not independently trigger notifications.
- The script reports failed systemd services but does not automatically restart them.
- Memory calculations use the `free` command's reported used memory and do not account for every possible Linux memory interpretation.
- The script is a diagnostic utility, not a replacement for a dedicated monitoring platform.

## Technologies

- Bash
- Linux
- `df`
- `awk`
- `free`
- `systemctl`
- Cron

## Conclusion

This project demonstrates practical Bash scripting for Linux administration and DevOps operations. It combines system information gathering, resource threshold checks, and service status reporting in a reusable script that can be executed manually or integrated into scheduled operational workflows.