#!/bin/bash

# Read HOSTNAME
read -p "Enter Hostname for this system value: " hostname
# Replace "HOSTNAME" in configuration.nix
sed "s|HOSTNAME|${hostname}|g" "../install.nix" > "../install.nix.tmp"
mv ../install.nix.tmp ../install.nix.nix


# Prompt the user for the /dev/DISK value
read -p "Enter /dev/DISK value: " disk_value

# Replace "DISK" in script 1
sed "s|/dev/DISK|/dev/${disk_value}|g" "1-install.sh" > "1-install.sh.tmp"
mv 1-install.sh.tmp 1-install.sh

# Replace "DISK" in script 2
sed "s|/dev/DISK|/dev/${disk_value}|g" "2-install.sh" > "2-install.sh.tmp"
mv 2-install.sh.tmp 2-install.sh


echo "Replacement complete."
echo "Double check if DISKS have been replaced correctly."
echo " !!!!!!!"
echo "Double check the 2. install script if partitions are correctly set"
