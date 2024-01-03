#!/bin/bash

items=("xfce" "fvwm" "lxqt" "openbox")
echo "Select an item from the list:"

for index in "${!items[@]}"; do
  echo "$((index+1)). ${items[index]}"
done

read -p "Enter the item number: " choice

if [[ $choice -ge 1 && $choice -le ${#items[@]} ]]; then
  echo "You selected: ${items[choice-1]}"
  output=""

  case ${items[choice-1]} in
    xfce)
      output="termux-x11 :1 -xstartup 'dbus-launch --exit-with-session xfce4-session'"
      ;;
    fvwm)
      output="termux-x11 :1 -xstartup fvwm dbus-launch --exit-with-session fvwm"
      ;;
    lxqt)
      output="termux-x11 :1 -xstartup lxqt dbus-launch --exit-with-session lxqt-session"
      ;;
    openbox)
      output="termux-x11 :1 -xstartup openbox dbus-launch --exit-with-session openbox-session"
      ;;
  esac

  echo "Output: $output"

else
  echo "Invalid choice!"
fi
