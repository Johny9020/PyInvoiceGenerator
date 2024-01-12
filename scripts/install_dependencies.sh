#!/bin/bash

OS=$(uname)

if [[ "$OS" == "Darwin" ]]; then
    # Install dependencies
    clear
    echo "OS: MacOS"
    echo "Installing dependencies using brew..."
    brew install wkhtmltopdf || { echo "Failed to install whtmltopdf" ; exit 1; }
elif [[ "$OS" == "Linux" ]]; then
    # Install dependencies
    clear
    echo "OS: Linux"
    echo "Installing dependencies..."
    sudo apt-get update
    sudo apt-get install -y wkhtmltopdf || { echo "Failed to install whtmltopdf" ; exit 1; }
else
    echo "Unsupported OS detected"
    exit 1
fi

clear
echo "Dependencies installed successfully"