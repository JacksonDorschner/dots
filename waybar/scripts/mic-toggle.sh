#!/bin/bash

# Toggle mute on the default input source
pactl set-source-mute @DEFAULT_SOURCE@ toggle
