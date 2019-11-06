#!/bin/bash

ENVIRON=${1:-"local"}

if [ -z "$1" ]
then
    echo "To configure for a server run with 'ENV_CONFIG': ./setup.sh your_env."
fi

backup_file() {
    filename=$1
    now=$(date +"%m_%d_%Y")

    if [ -f "$filename" ]; then
        echo "${filename} exists - creating backup"
        cp "$filename" "${filename}_backup_${now}"
    fi
}

backup_file "settings.ini"

echo "Changing environment to be: $ENVIRON"

sed "s/environment \=.*/environment = $ENVIRON/g" settings.ini.in > settings.ini
