# #!/usr/bin/bash
# Function to perform backup
set -e

. ~/dotfiles/backups/.env

echo "Choose the library you want to back up:"
echo "1 Work"
echo "2 Personal"
read -p "Enter the number of your choice: " choice

case $choice in
    1)
        S3_PATH="work"
        ;;
    2)
        S3_PATH="personal"
        ;;
    *)
        echo "Invalid choice."
        exit 1
        ;;
esac

# Initialize the repo
# restic -r "s3:https://s3.amazonaws.com/${AWS_BUCKET}/${S3_PATH}"  init

restic -r "s3:https://s3.amazonaws.com/${AWS_BUCKET}/${S3_PATH}"  backup /home/morgan/Documents/Projects --exclude-file=/home/morgan/dotfiles/backups/resticignore --dry-run

read -p "Run for real? y/n" run

case $run in
    y)
        restic -r "s3:https://s3.amazonaws.com/${AWS_BUCKET}/${S3_PATH}"  backup /home/morgan/Documents/Projects --exclude-file=/home/morgan/dotfiles/backups/resticignore
        ;;
    *)
        echo "Exiting"
        exit 1
        ;;
esac

read -p "Prune? y/n" prune

case $prune in
    y)
        restic -r "s3:https://s3.amazonaws.com/${AWS_BUCKET}/${S3_PATH}" forget --keep-last 1
        restic -r "s3:https://s3.amazonaws.com/${AWS_BUCKET}/${S3_PATH}" stats --mode raw-data
        ;;
    *)
        echo "Exiting"
        exit 1
        ;;
esac
