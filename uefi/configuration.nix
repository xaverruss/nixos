{ config, pkgs, ... }:

{
  imports = [ # Include hardware config and install.nix
    ./hardware-configuration.nix
    ./nixfiles/install.nix
    # Optional nixfiles
    # ./nixfiles/gnome.nix
    # ./nixfiles/kde.nix
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

  # Use this if it is some weird Laptop / Intel Compute stick
  # boot.loader = {
  #   efi = { canTouchEfiVariables = false; };
  #   grub = {
  #     efiSupport = true;
  #     efiInstallAsRemovable = true;
  #     device = "nodev";
  #   };
  # };

  # Use this if you need to store kernel and init.d on / 
  # Happens if you do not have enoth space on /boot, like Oracle VPS
  # Change following line in hardware-configuration.nix
  # fileSystems."/boot/efi" = ... # ← mount your ESP here instead of at /boot/.

  # boot.loader = {
  #   efi = {
  #     canTouchEfiVariables = true;
  #     efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
  #   };
  #   grub = {
  #      efiSupport = true;
  #      #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
  #      device = "nodev";
  #   };
  # };

}
