#!/bin/bash
 
entries="Active Screen Output Area Window"
 
selected=$(printf '%s\n' $entries | wofi --style=$HOME/.config/wofi/style.widgets.css --conf=$HOME/.config/wofi/config.screenshot | awk '{print tolower($1)}')
 
case $selected in
  active)
    ~/.config/sway/scripts/grimshot --notify save active;;
  screen)
    ~/.config/sway/scripts/grimshot --notify save screen;;
  output)
    ~/.config/sway/scripts/grimshot --notify save output;;
  area)
    ~/.config/sway/scripts/grimshot --notify save area;;
  window)
    ~/.config/sway/scripts/grimshot --notify save window;;
esac
