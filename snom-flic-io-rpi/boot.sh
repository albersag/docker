#!/bin/bash

/etc/init.d/dbus start

hciconfig hci0 up

hciconfig hci0

/home/snom/bluez-5.37/src/bluetoothd -nEd &

/home/snom/flic/fliclib-linux-hci-0.3/bin/armv6l/flicd -f flic.sqlite3 -d


