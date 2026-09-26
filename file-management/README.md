## Purpose

A practical Linux/DevOps project demonstrating **Bash scripting, filesystem operations, safe filename handling, command-line arguments, file discovery, and text processing**.

A Bash utility for discovering large files safely and displaying results sorted by human-readable file size.


## Features

- Searches a specified directory for large files
- Accepts a configurable minimum file size
- Safely handles filenames containing spaces
- Resolves directory paths reliably
- Sorts results by human-readable size
- Read-only — does not modify or delete files

## Key Commands I used in pipe 

`Bash` · `find` · `du` · `sort` · `realpath`

## Usage

Make the script executable:

```bash
chmod +x find-large-files.sh
````

Run the script by providing a directory and minimum file size:

```bash
./find-large-files.sh /var/log 100M
```

Example:

```text
/path/to/file1.log    125M
/path/to/file2.log    350M
/path/to/file3.log    1.2G
```

## Project Structure

```text
file-management/
├── find-large-files.sh
└── README.md
```

## Safety

The script is read-only. It does not:

* Delete files
* Modify files
* Move or rename files
* Change file permissions

## Future Improvements

* Configurable output formats
* Export results to CSV
* Exclude specific directories
* Recursive search options
* Logging
* Automated disk-usage alerts