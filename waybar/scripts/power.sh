#!/bin/bash

# Show a power menu using rofi
option=$(echo -e "Shutdown\nReboot\nLogout\nSuspend" | rofi -dmenu -p "Power")

# Act on the selected option
case "$option" in
  Shutdown) systemctl poweroff ;;
  Reboot) systemctl reboot ;;
  Logout) hyprctl dispatch exit ;;  # Or swaymsg exit
  Suspend) systemctl suspend ;;
esac

