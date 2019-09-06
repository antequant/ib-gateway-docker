#!/bin/bash

set -e
set -o errexit

x11vnc -usepw -create -forever &
/opt/ibc/scripts/ibcstart.sh $(ls ~/Jts/ibgateway) --gateway --mode=paper