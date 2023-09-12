{ config, pkgs, ... }:

{
  imports = [ # Include hardware config and install.nix
    ./hardware-configuration.nix
    ./install.nix
  ];

  # Setup GRUB Device
  boot.loader.grub.device = "/dev/DISK";
}
