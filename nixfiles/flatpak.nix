{ pkgs, ... }: {
  services.flatpak.enable = true;
  systemd.services.configure-flathub-repo = {
    wantedBy = [ "default.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
  # Add firefox, ya need a browser dont ya ? 
  environment.systemPackages = with pkgs; [ firefox ];
}
