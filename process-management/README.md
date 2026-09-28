# Process Management

A read-only Bash utility that reports running processes sorted by CPU consumption, with a configurable number of results.

## Features

- Displays top CPU-consuming processes
- Shows PID, parent PID, command, CPU, and memory usage
- Supports a configurable number of results
- Read-only — does not terminate or modify processes

## Technologies

`Bash` · `ps` · `head`

## Usage

```bash
chmod +x process-report.sh

./process-report.sh
./process-report.sh 25
````

The optional argument specifies the number of processes to display.

## Project Structure

```text
process-management/
├── process-report.sh
└── README.md
```

## Security

* No credentials, tokens, or passwords are stored in the project.
* The script does not terminate or modify processes.
* Run with the minimum privileges required.

## Future Improvements

* Add configurable CPU and memory thresholds
* Add process monitoring alerts
* Add logging
* Export reports to CSV or JSON
* Integrate with system monitoring tools

## What This Demonstrates

Bash scripting, Linux process management, command-line arguments, system monitoring, and text processing.

```

