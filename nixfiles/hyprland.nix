{ config, pkgs, ... }:

{
  imports = [ ./flatpak.nix ];

  programs.hyprland.enable = true;

}
