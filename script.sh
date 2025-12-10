#!/bin/bash
echo "Starting system update..."
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
echo "System update completed successfully!"

