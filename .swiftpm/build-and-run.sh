#! /bin/sh
set -e
(killall 'Playdate Simulator' || true) 2>/dev/null
cd ..
swift package pdc --product $PRODUCT_NAME

# Create a symbolic link to the compiled pdx in the Playdate Simulator Games dir
# This allows browsing the pdx as a sideloaded game, helpful for checking icons
if [ -e ~/Developer/PlaydateSDK/Disk/Games/$PRODUCT_NAME.pdx ]
then
    rm -rf ~/Developer/PlaydateSDK/Disk/Games/$PRODUCT_NAME.pdx
fi
ln -s "$(pwd)/.build/plugins/PDCPlugin/outputs/$PRODUCT_NAME.pdx" ~/Developer/PlaydateSDK/Disk/Games/$PRODUCT_NAME.pdx

# Run the pdx in the Playdate Simulator
~/Developer/PlaydateSDK/bin/Playdate\ Simulator.app/Contents/MacOS/Playdate\ Simulator ~/Developer/PlaydateSDK/Disk/Games/$PRODUCT_NAME.pdx
