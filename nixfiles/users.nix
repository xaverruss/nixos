{ pkgs, ... }: {

  users.users.user = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "user";
    extraGroups = [ "networkmanager" ];
    # initialHashedPassword = "passwd";
  };
  users.users.admin = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "admin";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    initialHashedPassword = "changeme";
  };

}
