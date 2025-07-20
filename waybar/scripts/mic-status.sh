#!/bin/bash

# Get default source mute status using pactl
is_muted=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')

if [ "$is_muted" = "yes" ]; then
    echo "mic_none"   # Mic muted icon (you can customize)
else
    echo "mic"    # Mic active icon
fi
