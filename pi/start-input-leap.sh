#!/bin/bash

# Raspberry Pi Input Leap client launcher.
# Known-good test environment: Raspberry Pi OS / Raspbian 13 (Trixie), armv7l,
# X11/Openbox backend, Input Leap 3.0.3 git build.
#
# Change SERVER if the Input Leap server uses a different LAN address.

SERVER="192.168.1.197"
CLIENT="$HOME/input-leap/build/bin/input-leapc"

echo "Input Leap Client - scummbox"
echo "Connecting to server at $SERVER..."
echo

exec "$CLIENT" -f --disable-crypto --name scummbox "$SERVER"
