{ config, pkgs, ... }: {
  boot.loader.systemd-boot = {
    netbootxyz.enable = true;
    memtest86.enable = true;
  };

  users.users.root = {
    initialHashedPassword = "changeme";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEFdTFM5ZbGytRp8orRu4cK+kLcQdPFVKqaN0iNVlp2p slothington"
    ];
  };

  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;

  # SSH
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    hostKeys = [
      {
        path = "/root/.ssh/";
        type = "ed25519";
      }
      {
        bits = 4096;
        path = "/etc/ssh/ssh_host_rsa_key";
        type = "rsa";
      }
      {
        path = "/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }
    ];
  };

  # Allow Unfree
  nixpkgs.config.allowUnfree = true;

  # Enable Zerotier
  services.zerotierone = {
    enable = true;
    joinNetworks = [ "9f77fc393eef1e5b" ];
  };

  environment.systemPackages = with pkgs; [
    git
    wget
    btop
    ncdu
    tmux
    neofetch
    nano
    vim
    tree
    pstree
    busybox
    croc
    btrfs-progs
  ];

  networking.hostName = "HOSTNAME";

  # Repo SSH URL
  # ssh://git@gitea.hostedbymyself.de:2022/xaver.russ/nixconfig.git

}

