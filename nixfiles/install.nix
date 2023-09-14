{ config, pkgs, ... }: {

  # Set bootload timeout to 1 sec
  boot.loader.timeout = 1;

  # Root User
  users.users.root = {
    initialPassword = "1234";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEFdTFM5ZbGytRp8orRu4cK+kLcQdPFVKqaN0iNVlp2p slothington"
    ];
  };

  # Auto system upgrades
  system.autoUpgrade = {
    enable = true;
    persistent = true;
    channel = "https://channels.nixos.org/nixos-23.05";
    dates = "daily";
    randomizedDelaySec = "45min";
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # auto optimise store
  nix.settings.auto-optimise-store = true;
  nix.extraOptions = ''
    min-free = ${toString (100 * 1024 * 1024)}
    max-free = ${toString (1024 * 1024 * 1024)}
    keep-outputs = false
    keep-derivations = false
  '';

  # Experimental Features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Limit journal size
  services.journald.extraConfig = "SystemMaxUse=250M";

  # tmp Clean and zramswap
  boot.tmp.cleanOnBoot = true;
  zramSwap = {
    enable = true;
    priority = 1000;
  };

  # swapDevices = [{
  #   device = "/var/lib/swapfile";
  #   size = 2 * 1024;
  #   priority = 5;
  #   discardPolicy = "both";
  #   options = [ "nofail" "defaults" ];
  # }];

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
    speedtest-cli
    magic-wormhole

  ];
}

