#!/bin/bash

# Get current volume (use pamixer, amixer, or pactl)
VOLUME=$(pamixer --get-volume)

# Create ASCII bar
BAR_LENGTH=10
FILLED=$((VOLUME * BAR_LENGTH / 100))
EMPTY=$((BAR_LENGTH - FILLED))

BAR=$(printf "%0.s#" $(seq 1 $FILLED))
BAR+=$(printf "%0.s-" $(seq 1 $EMPTY))
if [$VOLUME -eq $0]
then echo "volume_off [BAR] $VOLUME%"
else echo "Vol: [$BAR] $VOLUME%" 
fi
