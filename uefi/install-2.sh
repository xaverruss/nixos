# Install Helper 
echo "installer helper 1"

mkfs.ext4 -L nixos /dev/DISK1
mkfs.fat -F 32 -n boot /dev/DISK2        
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot                      
mount /dev/disk/by-label/boot /mnt/boot 
nixos-generate-config --root /mnt


## Setup configuration.nix
echo " " 
echo " "
echo "Setting up /mnt/etc/nixos"
cp ./configuration.nix /mnt/etc/nixos/configuration.nix
cp ../install.nix /mnt/etc/nixos/install.nix