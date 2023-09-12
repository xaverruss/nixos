

cp /root/nixos/install.nix /mnt/etc/nixos/

nano /mnt/etc/nixos/configuration.nix

<!-- ADD Import -->
imports = [ ./install.nix ];

<!-- make sure systemd boot is enabled -->
boot.loader.grub.device = "/dev/nvme0n1p";   # (for BIOS systems only)

<!-- change Hostname to wanted HostName -->

<!-- Execute nixos-install and reboot -->
nixos-install
shutdown -r now  

<!-- Tipp -->
Use nano CTL + \  ( beim ß) to replace DISK PARTITION1


Carefull with NVME, they tend to use /dev/nvme0p1 or other stuff

