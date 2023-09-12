{ config, pkgs, ... }:

{
  imports = [ # Include hardware config and install.nix
    ./hardware-configuration.nix
    ./nixfiles/install.nix
    # Optional nixfiles
    # ./nixfiles/gnome.nix
    # ./nixfiles/kde.nix
  ];

  # Setup GRUB Device
  boot.loader.grub.device = "/dev/DISK";
}
