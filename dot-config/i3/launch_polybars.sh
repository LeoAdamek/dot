#!/usr/bin/env sh

# Kill all existing Polybars
killall -q polybar

# Wait until they're all finished.
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -c $HOME/.config/polybar/config.ini main &

echo "Launched Polybars."
