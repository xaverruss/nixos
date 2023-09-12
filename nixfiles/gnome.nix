{ config, pkgs, ... }:

{
  imports = [ ./flatpak.nix ];
  # Enable network manager
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Enable Remote desktop
  services.xrdp.enable = true;
  # networking.firewall.allowedTCPPorts = [ 3389 ];
  services.gnome.gnome-remote-desktop.enable = true;

  environment.gnome.excludePackages =
    (with pkgs; [ gnome-photos gnome-tour gnome-text-editor ])
    ++ (with pkgs.gnome; [
      cheese # webcam tool
      gnome-music
      # gnome-terminal
      epiphany # web browser
      geary # email reader
      evince # document viewer
      gnome-characters
      totem # video player
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
      gnome-calculator
      yelp # help viewer
      gnome-maps
      gnome-weather
      gnome-contacts
      simple-scan
    ]);

}
