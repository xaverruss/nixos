#!/bin/bash

echo "thought you might have forgot :D "
lsblk
echo " "

# Prompt the user for the /dev/DISK value
read -p "Enter /dev/DISK value: " disk_value
# Read HOSTNAME
read -p "Enter Hostname for this system value: " hostname
# Check Back with user
read -p "OK ? else, CTRL + C "

# HOSTNAME replace 
sed -i "s/HOSTNAME/$hostname/g" install.nix
echo "Replaced in install.nix"

# UEFI replace
for file in "uefi"/*; do
  if [ -f "$file" ]; then
    # Replace "DISK" with the value of the hostname disk_value
    sed -i "s/DISK/$disk_value/g" $file
    echo "Replaced in $file"
  fi
done

# LEGACY replace
for file in "legacy"/*; do
  if [ -f "$file" ]; then
    # Replace "DISK" with the value of the hostname disk_value
    sed -i "s/DISK/$disk_value/g" "$file"
    echo "Replaced in $file"
  fi
done


echo "Replacement complete."
echo "Double check if DISKS have been replaced correctly."
echo " !!!!!!!"
echo "Double check the 2. install script if partitions are correctly set"

echo " "
echo "This system currently uses:"
if [ -d "/sys/firmware/efi" ]; then
  echo "UEFI mode"
  cd ./uefi
  bash
else
  echo "Legacy (BIOS) mode"
  cd ./legacy
  bash
fi
