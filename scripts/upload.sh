#!/bin/bash

# Source Vars
source $CONFIG

# Change to the Source Directory
cd ~

# Color
ORANGE='\033[0;33m'

# Display a message
echo "============================"
echo "Uploading the Build..."
echo "============================"

# Change to the Output Directory
cd out/target/product/${DEVICE}

# Set FILENAME var
FILENAME=recovery.img
FILENAME2=boot.img

# Upload to oshi.at
if [ -z "$TIMEOUT" ];then
    TIMEOUT=20160
fi

# Upload to WeTransfer
# NOTE: the current Docker Image, "registry.gitlab.com/sushrut1101/docker:latest", includes the 'transfer' binary by Default
transfer wet $FILENAME > link.txt || { echo "ERROR: Failed to Upload the Build!" && exit 1; }
transfer wet $FILENAME2 > link2.txt || { echo "ERROR: Failed to Upload the Build!" && exit 1; }


DL_LINK=$(cat link.txt | grep Download | cut -d\  -f3)
DL_LINK2=$(cat link2.txt | grep Download | cut -d\  -f3)

# Show the Download Link
echo "=============================================="
echo "Download Link: ${DL_LINK}" || { echo "ERROR: Failed to Upload the Build!"; }
echo "Download Link: ${DL_LINK2}" || { echo "ERROR: Failed to Upload the Build!"; }
echo "=============================================="

DATE_L=$(date +%d\ %B\ %Y)
DATE_S=$(date +"%T")

# Exit
exit 0
