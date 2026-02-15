#! /bin/sh

# Note: this shell script runs on Mac OS only

set -e

SWIFT=$(xcrun -f swift -toolchain "swift latest")

cd ..
"$SWIFT" package pdc

# Create a symbolic link to the compiled pdx in the Playdate Simulator Games dir
# This allows browsing the pdx as a sideloaded game, helpful for checking icons
if [ -L ~/Developer/PlaydateSDK/Disk/Games/$PRODUCT_NAME.pdx ]; then
    rm -rf ~/Developer/PlaydateSDK/Disk/Games/$PRODUCT_NAME.pdx
fi
ln -s "$(pwd)/.build/plugins/PDCPlugin/outputs/$PRODUCT_NAME.pdx" ~/Developer/PlaydateSDK/Disk/Games/$PRODUCT_NAME.pdx

# Using `open` instead of calling the Playdate Simulator directly allows it to be opened if it's not already running, and also allows it to be focused retaining position on screen if it is already running. 
# This is helpful for quick iteration and prevents the Simulator from being hidden by the code editor window.
open ~/Developer/PlaydateSDK/Disk/Games/$PRODUCT_NAME.pdx
