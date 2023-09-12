{ pkgs, ... }: {

  users.users.user = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "user";
    extraGroups = [ "networkmanager" ];
    # initialPassword = "passwd";
  };
  users.users.admin = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "admin";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    initialPassword = "changeme";
  };

}
