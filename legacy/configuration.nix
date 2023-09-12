{ config, pkgs, ... }:

{
  imports = [ # Include hardware config and install.nix
    ./hardware-configuration.nix
    ./gh/nixfiles/install.nix
    # Optional nixfiles
    # ./gh/nixfiles/gnome.nix
    # ./gh/nixfiles/kde.nix
    # ./gh/nixfiles/hyprland.nix
  ];

  # Setup GRUB Device
  boot.loader.grub.device = "/dev/DISK";

  system.stateVersion = "23.05";
  networking.hostName = "HOSTNAME";

}
