#!/bin/bash

INFO=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
IS_MUTED=$(echo "$INFO" | grep -q MUTED && echo "true" || echo "false")
VOLUME_RAW=$(echo "$INFO" | awk '{print $2}')
VOLUME_PERCENT=$(printf "%.0f" "$(echo "$VOLUME_RAW * 100" | bc -l)")

BAR_LENGTH=10
FILLED=$((VOLUME_PERCENT * BAR_LENGTH / 100))
EMPTY=$((BAR_LENGTH - FILLED))
BAR=$(printf "%0.s▓" $(seq 1 $FILLED))
BAR+=$(printf "%0.s░" $(seq 1 $EMPTY))

if [ "$IS_MUTED" = "true" ]; then
    echo "{\"text\": \"<span color='red'>🔇 $BAR</span>\", \"tooltip\": \"Muted\"}"
else
    echo "{\"text\": \"<span>🔊 $BAR</span>\", \"tooltip\": \"$VOLUME_PERCENT%\"}"
fi
