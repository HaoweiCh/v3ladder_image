#! /bin/bash

# Check if the image command is "start app"
if [ "$1" = "app" ]; then
    echo "Checking for required dat files..."

    # Check if geoip.dat exists
    if [ ! -f geoip.dat ]; then
        echo "geoip.dat not found. Downloading..."
        curl -s -L -o geoip.dat "https://github.com/v2fly/geoip/raw/release/geoip.dat"
    fi

    # Check if geoip-only-cn-private.dat exists
    if [ ! -f geoip-only-cn-private.dat ]; then
        echo "geoip-only-cn-private.dat not found. Downloading..."
        curl -s -L -o geoip-only-cn-private.dat "https://github.com/v2fly/geoip/raw/release/geoip-only-cn-private.dat"
    fi

    # Check if geosite.dat exists
    if [ ! -f geosite.dat ]; then
        echo "geosite.dat not found. Downloading..."
        curl -s -L -o geosite.dat "https://github.com/v2fly/domain-list-community/raw/release/dlc.dat"
    fi

    echo "All required dat files are present."

fi

exec $@