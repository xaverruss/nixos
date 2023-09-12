{ config, pkgs, ... }: {
  # Root User
  users.users.root = {
    initialHashedPassword = "1234";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEFdTFM5ZbGytRp8orRu4cK+kLcQdPFVKqaN0iNVlp2p slothington"
    ];
  };

  # tmp Clean and zramswap
  boot.tmp.cleanOnBoot = true;
  zramSwap = {
    enable = true;
    priority = 1000;
  };
  swapDevices = [
    {
      label = "swap";
      discardPolicy = "both";
      priority = 100;
      options = [ "nofail" "defaults" ];
    }
    {
      label = "swap2";
      discardPolicy = "both";
      priority = 99;
      options = [ "nofail" "defaults" ];
    }
    {
      device = "/tmp/swapfile";
      size = 2048;
      discardPolicy = "both";
      priority = 5;
      options = [ "nofail" "defaults" ];
    }
  ];

  # SSHD and Hostkeys
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

  # Shell
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  programs.zsh = {
    enable = true;
    setOptions = [ "HIST_IGNORE_DUPS" "SHARE_HISTORY" "HIST_FCNTL_LOCK" ];
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "wakeonlan"
        "zsh-navigation-tools"
        "zsh-interactive-cd"
        "timer"
        "systemd"
        "systemadmin" # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/systemadmin
      ];
      theme = "af-magic";
    };
  };

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
}

