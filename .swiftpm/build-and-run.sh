#! /bin/sh
set -e
(killall 'Playdate Simulator' || true) 2>/dev/null
cd ..
~/Developer/PlaydateSDK/bin/Playdate\ Simulator.app/Contents/MacOS/Playdate\ Simulator .build/plugins/PDCPlugin/outputs/$PRODUCT_NAME.pdx
swift package pdc --product $PRODUCT_NAME
