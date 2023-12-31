#!/bin/bash

# Set the file name
file="myCommits.txt"

# Check if the file exists
if [ ! -e "$file" ]; then
    # Create a new file and append the initial commit message
    echo "Commit 1    Date [$(date '+%d-%m-%Y')] Time [$(date '+%I:%M %p')]" > "$file"
else
    # Append a new commit message to the file
    commitNumber=$(wc -l < "$file")
    ((commitNumber++))
    echo "Commit $commitNumber    Date [$(date '+%d-%m-%Y')] Time [$(date '+%I:%M %p')]" >> "$file"
fi

# Pull the latest changes from the remote repository
git pull

# Stage the file for commit
git add "$file"

# Commit the changes
git commit -m "Add new commit messages"

# Push the changes to the remote repository
git push
