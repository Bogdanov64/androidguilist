#!/bin/bash

options=("xfce4" "lxqt" "fvwm" "Quit")

select opt in "${options[@]}"; do
    case $opt in
        "xfce4")
            echo "You selected xfce4"
termux-x11 :1 -xstartup "xfce4-session"
            ;;
        "lxqt")
            echo "You selected lxqt"
termux-x11 :1 -xstartup lxqt-session
            ;;
        "fvwm")
            echo "You selected fvwm"
termux-x11 :1 -xstartup fvwm
            ;;
        "Quit")
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
done
