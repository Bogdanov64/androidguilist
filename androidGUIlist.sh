  GNU nano 6.2                                                                                                     ./list-01.sh                                                                                                               
#!/bin/bash

options=("xfce4" "fvwm" "openbox" "fluxbox")

# Print the menu and store the selected option in the variable 'selected'
select selected in "${options[@]}"; do
  case $selected in
    "xfce4")
      command="dbus-launch --exit-with-session xfce4-session"
      break
      ;;
    "fvwm")
      command="dbus-launch --exit-with-session fvwm"
      break
      ;;
    "openbox")
      command="dbus-launch --exit-with-session openbox"
      break
      ;;
    "fluxbox")
      command="dbus-launch --exit-with-session fluxbox"
      break
      ;;
    *) echo "Invalid option";;
  esac
done

# Execute the selected command with 'termux-x11'
termux-x11 :1 -xstartup "$command"



