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

  services.gnome = {
    tracker.enable = true;
    sushi.enable = true;
    gnome-user-share.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.gsconnect
    gnomeExtensions.wifi-qrcode
  ];
}
