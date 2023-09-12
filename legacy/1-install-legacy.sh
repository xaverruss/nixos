# Install Helper 1
echo "installer helper 1 - partitioning"
echo "Replace DISK with the disk you wanna use"

parted /dev/DISK -- mklabel msdos
parted /dev/DISK -- mkpart primary 1MB 100%

