# Raspberry Pi client setup

This folder preserves the Raspberry Pi side of the Input Leap setup that was tested end-to-end with the Windows build in this fork.

## Verified environment

- Raspberry Pi OS / Raspbian 13 (Trixie), `armv7l`
- Input Leap built locally from this source tree
- Tested client reported Input Leap 3.0.3 git build, protocol 1.6
- X11/Openbox desktop backend
- Client name: `scummbox`
- TCP port 24800
- Known-good test used `--disable-crypto` on both client and server

Input Leap warned that it would not work as expected under XWayland. The tested Pi was switched with `sudo raspi-config`:

`Advanced Options -> Wayland -> W1 X11 Openbox window manager with X11 backend`

After reboot, the verified environment was:

- `XDG_SESSION_TYPE=x11`
- `DISPLAY=:0.0`
- `WAYLAND_DISPLAY` empty

## Launcher

Copy `start-input-leap.sh` to:

`/home/jer/bin/start-input-leap.sh`

Make it executable:

`chmod +x /home/jer/bin/start-input-leap.sh`

Edit the `SERVER` value if the Windows/server LAN IP is different.

## Optional desktop shortcut

Copy `input-leap.desktop` to:

`/home/jer/Desktop/input-leap.desktop`

Then:

`chmod +x /home/jer/Desktop/input-leap.desktop`

## Optional autostart

Copy `input-leap-autostart.desktop` to:

`/home/jer/.config/autostart/input-leap.desktop`

Then:

`chmod +x /home/jer/.config/autostart/input-leap.desktop`

A real reboot test confirmed that the Pi client automatically restarted and reconnected after the X11 desktop loaded.

## Windows-side test

The working server command used during verification was:

`input-leaps.exe -f --disable-crypto --name Jer-Desktop -c C:\Users\miles\input-leap.sgc`

The Windows firewall required inbound TCP 24800 to be allowed.

The Windows server was intentionally kept manual rather than configured for autostart.
