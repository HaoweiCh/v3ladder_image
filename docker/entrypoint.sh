#! /bin/bash

# Check if the image command starts with the app
if [ "$1" = "app" ]; then
    if [ "$PWD" = "/app" ]
    then
        echo "Current working directory is /app"
    else
        echo "Current working directory is not /app" && cd /app
    fi

    echo "Checking for required dat files..."

    # Define an array of URLs for the dat files
    urls=(
        "https://github.com/v2fly/geoip/raw/release/geoip.dat"
        "https://github.com/v2fly/geoip/raw/release/geoip-only-cn-private.dat"
        "https://github.com/v2fly/domain-list-community/raw/release/dlc.dat"
    )

    # Define a function to download a single file
    download_file() {
        url=$1
        filename=$(basename $url)
        if [ ! -f $filename ]; then
            echo "$filename not found. Downloading..."
            curl -s -L -o $filename $url
        fi
    }

    # Download all files concurrently using background processes
    for url in ${urls[@]}; do
        download_file $url &
    done
    wait

    echo "All required dat files are present."
fi

exec $@