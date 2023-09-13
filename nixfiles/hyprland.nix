{ config, pkgs, ... }:

{
  imports = [ ./flatpak.nix ./users.nix ];

  # Services
  services = {
    xserver = {
      enable = true;
      displayManager.sddm = {
        enable = true;
        defaultSession = "Hyprland";
        settings = { General = { DisplayServer = "wayland"; }; };
      };
    };
  };

  programs = {
    hyprland = {
      enable = true;
      #nvidiaPatches = true;
      xwayland = {
        hidpi = true;
        enable = true;
      };
    };
    waybar = { enable = true; };
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman ];
    };
  };

  # XDG Portals
  # xdg = {
  #   autostart.enable = true;
  #   portal = {
  #     enable = true;
  #     extraPortals = [ pkgs.xdg-desktop-portal pkgs.xdg-desktop-portal-gtk ];
  #   };
  # };

  # Hardware
  hardware = {
    opengl = {
      enable = true;
      # driSupport = true;
      # driSupport32Bit = true;
      # extraPackages = with pkgs; [ vaapiVdpau libvdpau-va-gl ];
      # extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
      # setLdLibraryPath = true;
    };
  };

  environment.systemPackages = with pkgs; [
    weston
    waypaper
    swaybg
    pipewire
    mako
    kitty
    polkit_gnome
    # libva-utils
    fuseiso
    udiskie
    gnome.adwaita-icon-theme
    gnome.gnome-themes-extra
    # nvidia-vaapi-driver
    gsettings-desktop-schemas
    swaynotificationcenter
    wlr-randr
    ydotool
    hyprland-share-picker
    wl-clipboard
    hyprland-protocols
    hyprpicker
    swayidle
    swaylock
    xdg-desktop-portal-hyprland
    hyprpaper
    wofi
    firefox-wayland
    swww
    grim
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    qt5.qtwayland
    qt6.qmake
    qt6.qtwayland
    adwaita-qt
    adwaita-qt6
  ];
}
