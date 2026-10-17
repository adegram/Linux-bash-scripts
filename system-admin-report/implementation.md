A cross-platform Bash utility that provides a quick system inventory covering hostname, kernel, uptime, memory, and filesystem usage.

## Features

- Displays system hostname
- Reports kernel and operating system information
- Shows system uptime
- Reports memory usage
- Displays filesystem capacity
- Supports Linux and macOS
- Read-only — does not modify system configuration

## Technologies

`Bash` · `uname` · `uptime` · `df` · `free` · `vm_stat`

## Usage

Make the script executable:

```bash
chmod +x system-report.sh
````

Run the system report:

```bash
./system-report.sh
```

The script automatically uses:

* `free` for memory information on Linux
* `vm_stat` for memory information on macOS

## Project Structure

```text
system-administration/
├── system-report.sh
└── README.md
```

## Example Output

```text
Hostname: my-server
Kernel: Linux 6.x.x
Uptime: 5 days, 3 hours
Memory: 8 GB
Disk Usage:
/dev/sda1    100G    42G    58G    42%
```

## Safety

The script is read-only. It does not:

* Modify system configuration
* Delete files
* Install packages
* Change permissions
* Alter mounted filesystems

## Future Improvements

* CPU utilization reporting
* Network interface information
* Running process summary
* Load average monitoring
* OS distribution detection
* Export reports to JSON or CSV
* Automated system health alerts

## Purpose

A practical Linux/DevOps project demonstrating **Bash scripting, system administration, cross-platform scripting, command-line utilities, and basic system monitoring**.

