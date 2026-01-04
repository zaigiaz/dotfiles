#!/bin/bash

# Get a list of installed Flatpak applications and pass it to dmenu
APP=$(flatpak list --app | awk '{print $2}' | dmenu -i -p "Select Flatpak app:")

# If an application is selected, run it
if [[ -n "$APP" ]]; then
    flatpak run "$APP"
fi
