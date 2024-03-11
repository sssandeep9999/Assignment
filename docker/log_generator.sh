#!/bin/bash
# Create the directory if it doesn't exist
mkdir -p /home/web_application_data

while true; do
    # Generate a new file with a timestamp as the filename
    timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
    touch /home/web_application_data/file_$timestamp.txt
    echo "This is a application generated file from docker cotainer.$timestamp" > file_$timestamp.txt
    # Wait for 2 minutes
    sleep 60
done


#!/bin/bash

# Set the S3 bucket name
S3_BUCKET="prodlabassignment"

# Define the local directory to compare
LOCAL_DIR="/home/web_application_data"

# List local files
LOCAL_FILES=$(find "$LOCAL_DIR" -type f)

# List S3 objects
S3_OBJECTS=$(aws s3api list-objects --bucket "$S3_BUCKET" --output text --query 'Contents[*].Key')

# Iterate over local files
for FILE_PATH in $LOCAL_FILES; do
    FILE_NAME=$(basename "$FILE_PATH")
    # Check if the file is not present in S3
    if ! echo "$S3_OBJECTS" | grep -q "$FILE_NAME"; then
        echo "Uploading $FILE_NAME to S3..."
        aws s3 cp "$FILE_PATH" "s3://$S3_BUCKET/"
    fi
done

echo "Upload completed."
