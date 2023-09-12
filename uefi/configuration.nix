{ config, pkgs, ... }:

{
  imports = [ # Include hardware config and install.nix
    ./hardware-configuration.nix
    ./install.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      netbootxyz.enable = true;
      memtest86.enable = true;
    };
    efi.canTouchEfiVariables = true;
  };
}
