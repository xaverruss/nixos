
parted /dev/DISK -- mklabel gpt
parted /dev/DISK -- mkpart primary 512MB 100%
parted /dev/DISK -- mkpart ESP fat32 1MB 512MB
parted /dev/DISK -- set 2 esp on



