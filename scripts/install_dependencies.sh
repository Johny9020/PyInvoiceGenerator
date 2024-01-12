#!/bin/bash

OS=$(uname)

if [[ "$OS" == 'Darvin' ]]; then
  echo "Installing dependencies..."
  brew install pkg-config cairo gobject-introspection || { echo "Failed to install dependencies." ; exit 1; }

  echo "Finished installing dependencies."

  echo "Installing python dependencies..."
  pip install -r requirements.txt || { echo "Failed to install python dependencies." ; exit 1; }

  echo "Finished installing python dependencies."
elif [[ "$OS" == 'Linux' ]]; then
  echo "Updating system"
  sudo apt update -y || { echo "Failed to update system." ; exit 1; }

  echo "Installing dependencies..."
  sudo apt install pkg-config cairo gobject-introspection -y || { echo "Failed to install dependencies." ; exit 1; }

  echo "Finished installing dependencies."

  echo "Installing python dependencies..."
  pip install -r requirements.txt || { echo "Failed to install python dependencies." ; exit 1; }

  echo "Finished installing python dependencies."
fi

