#! /bin/sh
set -e
killall 'Playdate Simulator' || true
cd ..
swift package pdc
~/Developer/PlaydateSDK/bin/Playdate\ Simulator.app/Contents/MacOS/Playdate\ Simulator .build/plugins/PDCPlugin/outputs/$PRODUCT_NAME.pdx
