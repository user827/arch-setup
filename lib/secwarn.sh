#!/bin/sh
set -eu
journalctl -b -f -p4..4 -q | sec --debug=4 --syslog=local0 --conf=/etc/sec.d/warn.sec --notail --input=- --intevents
