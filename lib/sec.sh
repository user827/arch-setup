#!/bin/sh
set -eu
#journalctl -f -p3 -S now -q | sec --debug=4 --syslog=local0 --conf=/etc/sec.d/crit.sec --notail --input=-
journalctl -b -f -p3 -q | sec --debug=4 --syslog=local0 --conf=/etc/sec.d/crit.sec --notail --input=- --intevents
