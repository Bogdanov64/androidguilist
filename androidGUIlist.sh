#!/bin/bash

# Define the options
options=("xfce4" "fvwm" "openbox" "fluxbox")

# Create a dialog menu
selected=$(dialog --title "Select a Window Manager" \
                  --menu "Choose one of the following options:" \
                  15 50 4 \
                  "${options[@]}" \
                  3>&1 1>&2 2>&3)

# Check if the user pressed Cancel
exit_status=$?
if [ $exit_status != 0 ]; then
  echo "User canceled the selection."
  exit 1
fi

# Determine the command based on the selected option
case $selected in
  "xfce4")
    command="dbus-launch --exit-with-session xfce4-session"
    ;;
  "fvwm")
    command="dbus-launch --exit-with-session fvwm"
    ;;
  "openbox")
    command="dbus-launch --exit-with-session openbox"
    ;;
  "fluxbox")
    command="dbus-launch --exit-with-session fluxbox"
    ;;
  *) 
    echo "Invalid option"
    exit 1
    ;;
esac

# Execute the selected command with 'termux-x11'
termux-x11 :1 -xstartup "$command"
