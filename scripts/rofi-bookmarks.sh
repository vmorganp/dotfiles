# #!/bin/bash
set -e

# Path to your Firefox profiles directory
PROFILES_PATH="$HOME/.mozilla/firefox"

# Check if Firefox is running
if pgrep -x "firefox" >/dev/null; then
    echo "Firefox is running. Please close it before running this script."
    exit 1
fi

# Array to store bookmarks
declare -a BOOKMARKS_ARRAY

# Find all profile directories
PROFILE_DIRS=($(awk -F'=' '/^Path/ {print $2}' "$PROFILES_PATH/profiles.ini" | grep -v '^$'))

# Function to retrieve bookmarks from a given profile
retrieve_bookmarks() {
    local profile_dir="$1"
    local bookmarks
    bookmarks=$(sqlite3 "file:$profile_dir/places.sqlite?immutable=1" "SELECT moz_bookmarks.title, moz_places.url
    from moz_places, moz_bookmarks
    where moz_bookmarks.fk = moz_places.id
    and moz_bookmarks.type = 1
    and length(moz_bookmarks.title) > 0
    order by moz_bookmarks.title")

    echo "$bookmarks"
}

# Loop through each profile directory
for PROFILE_DIR in "${PROFILE_DIRS[@]}"; do
    if [ -f "$PROFILES_PATH/$PROFILE_DIR/places.sqlite" ]; then
        # Retrieve bookmarks for the current profile
        echo $PROFILES_PATH/$PROFILE_DIR
        profile_bookmarks=$(retrieve_bookmarks "$PROFILES_PATH/$PROFILE_DIR")

        # Check if bookmarks were found
        if [ -n "$profile_bookmarks" ]; then
            # Store bookmarks in the array
            mapfile -t BOOKMARKS_TEMP_ARRAY <<<"$profile_bookmarks"
            for LINE in "${BOOKMARKS_TEMP_ARRAY[@]}"; do
                BOOKMARKS_ARRAY+=("$LINE")
            done
        fi
    fi
done

# Check if there are bookmarks
if [ ${#BOOKMARKS_ARRAY[@]} -eq 0 ]; then
    echo "No bookmarks found."
    exit 1
fi

# Generate options for Rofi
OPTIONS=""
for ((i = 0; i < ${#BOOKMARKS_ARRAY[@]}; i++)); do
    LINE="${BOOKMARKS_ARRAY[i]}"
    TITLE=$(echo "$LINE" | cut -d '|' -f 1)
    URL=$(echo "$LINE" | cut -d '|' -f 2)
    OPTIONS="$OPTIONS\n$TITLE | $URL"
done

# Use Rofi to select a bookmark
SELECTED=$(echo -e "$OPTIONS" | rofi -dmenu -i -p "Select bookmark:" | awk '{print $NF}')

# Check if a bookmark is selected
if [ -z "$SELECTED" ]; then
    exit 0
fi

# Open the selected bookmark in Firefox
firefox "$SELECTED" &

