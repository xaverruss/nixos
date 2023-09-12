# Install Helper 
echo "installer helper 1"

# Common
mkfs.ext4 -L nixos /dev/DISK1
mount /dev/disk/by-label/nixos /mnt
nixos-generate-config --root /mnt

## Setup configuration.nix
echo "Setting up /mnt/etc/nixos"
cp ./configuration.nix /mnt/etc/nixos/configuration.nix
cp ../install.nix /mnt/etc/nixos/install.nix

