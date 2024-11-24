
# Delete `.DS_Store` Script

This is a simple Bash script to automate the removal of `.DS_Store` files from specified directories on macOS. It supports logging and can be set up as a recurring task using cron jobs.

---

## Features
- **Automated Deletion**: Removes all `.DS_Store` files within specified directories and their subdirectories.
- **Logging (Optional)**: Keeps a log of operations, including warnings for non-existent directories.
- **Cron Integration**: Can be scheduled to run automatically at regular intervals.

---

## Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/gma-bueroparallel/automated-ds-store-removal.git
cd automated-ds-store-removal
```

### 2. Make the Script Executable
```bash
chmod +x delete_ds_store.sh
```

### 3. Configure Directories
Edit the `delete_ds_store.sh` script to specify the directories where `.DS_Store` files should be removed:
```bash
DIRECTORIES=(
    "/path/to/directory"
    "$HOME/projects/example"
)
```

### 4. Optional: Enable Logging
- Uncomment the `LOG_FILE` line in the script:
  ```bash
  LOG_FILE="$HOME/PhpstormProjects/delete_ds_Store.logfile"
  ```
- Create the log file (optional):
  ```bash
  touch $HOME/PhpstormProjects/delete_ds_Store.logfile
  ```

---

## Running the Script

### Run Manually
Execute the script from your terminal:
```bash
./delete_ds_store.sh
```

### Automate with Cron
To automate the script, create a cron job:
1. Open the crontab editor:
   ```bash
   crontab -e
   ```
2. Add the following line to schedule the script (e.g., every minute):
   ```bash
   * * * * * /path/to/delete_ds_store.sh
   ```
3. Save and exit the editor.

---

## How It Works
1. Loops through the specified directories.
2. Checks if each directory exists.
3. Finds and deletes `.DS_Store` files using the `find` command:
   ```bash
   find "$DIR" -type f -name ".DS_Store" -exec rm -f {} \;
   ```
4. Logs the operation (if logging is enabled).

---

## Example Output
**Log File:**
```
2024-11-22 10:00:00 - Start deleting .DS_Store files ...
2024-11-22 10:00:01 - Delete .DS_Store files in: /path/example
2024-11-22 10:00:02 - WARNING: Directory does not exist: /nonexistent/path
2024-11-22 10:00:03 - Deletion of .DS_Store files is complete.
2024-11-22 10:00:03 - ---
```

---

## License
This project is licensed under the [MIT License](LICENSE).

---

## Contributing
Feel free to fork the repository and submit a pull request with your improvements!

---

### Additional Notes
- **What is `.DS_Store`?**
  `.DS_Store` files are metadata files created by Finder on macOS. They often clutter shared directories and version control systems.

- **Compatibility:**
  This script is designed for macOS systems using Bash.

