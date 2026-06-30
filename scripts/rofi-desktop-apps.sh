#!/bin/sh
killall rofi || true
rofi -theme material -show drun -matching fuzzy -disable-history -sort -sorting-method "fzf"
