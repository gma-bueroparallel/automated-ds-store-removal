#!/bin/bash

# Don't forget to make the script executable. Use the following command: `chmod +x delete_ds_store.sh`

# To automate the script creat a cron job e.g.:
# 1. use the command: `crontab -e`
# 2. * * * * * ~/PhpstormProjects/delete_ds_Store.sh
# 3. Save the file. That`s it.

# List of directories in which .DS_Store files are to be deleteid.
# Remove the example paths and edit them to suit your needs.
DIRECTORIES=(
    "/path/example"
    "$HOME/projects/example"
)

# Optional:
# to activate logging, remove the # and then create a .logfile and adjust the path accordingly.
# LOG_FILE="$HOME/PhpstormProjects/delete_ds_Store.logfile"

log_message() {
    local MESSAGE="$1"
    if [ -n "$LOG_FILE" ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - $MESSAGE" >> "$LOG_FILE"
    fi
}

log_message "Start deleting .DS_Store files ..."

# Loop through each directory and its sub directory from the list
for DIR in "${DIRECTORIES[@]}"; do
    # Check if the directory exists
    if [ -d "$DIR" ]; then
        log_message "Delete .DS_Store files in: $DIR"
        find "$DIR" -type f -name ".DS_Store" -exec rm -f {} \;
    else
        log_message "WARNING: Directory does not exist: $DIR"
    fi
done

log_message "Deletion of .DS_Store files is complete."
log_message "---"
