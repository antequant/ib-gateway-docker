#!/bin/bash

set -e
set -o errexit

Xvfb :0 &
sleep 1

x11vnc -display :0 -usepw -forever &

export DISPLAY=:0
/opt/ibc/scripts/ibcstart.sh $(ls ~/Jts/ibgateway) --gateway "--mode=$TRADING_MODE" "--user=$TWSUSERID" "--pw=$TWSPASSWORD" &

socat TCP-LISTEN:4002,fork TCP:localhost:4001,forever