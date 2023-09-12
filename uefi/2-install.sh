# Install Helper 
echo "installer helper 1"
echo "Replace DISK with the disk you wanna use"
echo "Carefull with NVME SSDs, double check partitioning"

mkfs.ext4 -L nixos /dev/DISK1
mkfs.fat -F 32 -n boot /dev/DISK2        # (for UEFI systems only)
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot                      # (for UEFI systems only)
mount /dev/disk/by-label/boot /mnt/boot # (for UEFI systems only)
nixos-generate-config --root /mnt


## Setup configuration.nix
echo "Setting up /mnt/etc/nixos"
cp ./configuration.nix /mnt/etc/nixos/configuration.nix
cp ../install.nix /mnt/etc/nixos/install.nix