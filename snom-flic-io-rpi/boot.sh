#!/bin/bash

service dbus start

hciconfig hci0 up

hciconfig hci0

/home/snom/bluez-5.37/src/bluetoothd -nEd &

/home/snom/flic/daemon -l -f flic.sqlite3 &
