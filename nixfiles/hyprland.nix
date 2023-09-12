{ config, pkgs, ... }:

{
  imports = [ ./flatpak.nix ./users.nix ];

  programs.hyprland.enable = true;

}
