#!/bin/bash

set -e
set -o errexit

Xvfb :0 &
x11vnc -display :0 -usepw -forever &

export DISPLAY=:0
/opt/ibc/scripts/ibcstart.sh $(ls ~/Jts/ibgateway) --gateway "--mode=$TRADING_MODE" "--user=$TWSUSERID" "--pw=$TWSPASSWORD"