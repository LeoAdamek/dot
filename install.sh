#!/usr/bin/env bash

CONF="$HOME/.config"
SRC=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

CONFIGS=("alacritty" "fuzzel" "nvim" "hypr" "waybar")

echo "Installing from $SRC to $CONF"

echo -n "Linking $HOME/.bin to $SRC/bin ...  "

if [ ! -d "$HOME/.bin" ]; then
  ln -s "$HOME/.bin" "$SRC/bin"
  echo "DONE"
else
  echo "already exists"
fi

for app in ${CONFIGS[*]}; do
  echo -n "Linking $CONF/$app to $SRC/$app ... "

  if [ ! -d "$CONF/$app" ]; then
    ln -s "$SRC/$app" "$CONF/$app"
    echo "DONE"
  else
    echo "already exists"
  fi
done

echo "Checking for an existing .zshrc"

if [ -L "$HOME/.zshrc" ]; then
  echo ".zshrc is already a link"
else
    if [ -f "$HOME/.zshrc" && ! -L "$HOME/.zshrc" ]; then
      echo "Existing .zshrc found, backing it up as .zshrc.orig"
      mv "$HOME/.zshrc" "$HOME/.zshrc.orig"
    fi
  ln -s "$SRC/zshrc.sh" "$HOME/.zshrc"
fi

