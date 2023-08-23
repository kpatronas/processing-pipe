#!/bin/bash

chmod +x /app/configuration/conf.sh
inotifywait -m -r -e close_write -e create -e moved_to --format '%f' "/app/input" | while read file;
do
   echo "/app/input/$file"
   /app/configuration/conf.sh "$file"
done

