#!/bin/bash

# Check if the image command starts with the app
if [ "$1" = "app" ]; then
    if [ "$PWD" = "/app" ]; then
        echo "Current working directory is /app"
    else
        echo "Current working directory is not /app" && cd /app
    fi

    echo "Checking for required dat files..."

    # Define an associative array of URLs for the dat files with the related information
    declare -A urls
    urls=(
        ["geoip.dat"]="https://github.com/v2fly/geoip/raw/release/geoip.dat"
        ["geoip-only-cn-private.dat"]="https://github.com/v2fly/geoip/raw/release/geoip-only-cn-private.dat"
        ["geosite.dat"]="https://github.com/v2fly/domain-list-community/raw/release/dlc.dat"
    )

    # Define a function to download a single file
    download_file() {
        filename=$1
        url=$2
        if [ ! -f $filename ]; then
            echo "$filename not found. Downloading..."
            wget -q $url -O $filename
        fi
    }

    # Download all files concurrently using background processes
    for filename in "${!urls[@]}"; do
        download_file $filename ${urls[$filename]} &
    done
    wait

    echo "All required dat files are present."
fi

export PATH=$PATH:/app

exec $@
