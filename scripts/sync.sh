#!/bin/bash

# Source Vars
source $CONFIG

# Change to the Home Directory
cd ~

# Clone the Sync Repo
repo init --depth=1 -u $TWRP_SYNC -b $TWRP_BRANCH
repo sync

# Clone Trees
DT_PATH="device/${OEM}/${DEVICE}"
git clone $DT_LINK $DT_PATH || { echo "ERROR: Failed to Clone the Device Trees!" && exit 1; }


# Exit
exit 0
