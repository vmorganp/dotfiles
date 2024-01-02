#!/bin/bash

# TODO there's probably a smarter way to cd here
cd ~/.mozilla/firefox/2uus9lqd.default-release/
if ! [ -x "$(command -v sqlite3)" ]; then
    echo "sqlite3 is not installed buddy"
    exit 1
fi

bookmarks=$(sqlite3 'file:places.sqlite?immutable=1' "select moz_bookmarks.title, moz_places.url
                       from moz_places, moz_bookmarks
                       where moz_bookmarks.fk = moz_places.id
                       and moz_bookmarks.type = 1
                       and length(moz_bookmarks.title) > 0
                       order by moz_bookmarks.dateAdded")
selection=$(echo "$bookmarks" | rofi -dmenu -i -p "Select bookmark: ")
link=$(echo $selection | cut -d "|" -f 2)
open $link
