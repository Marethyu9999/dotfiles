{ config, pkgs, ... }:

{

  home.username = "erik";
  home.homeDirectory = "/home/erik";

  home.stateVersion = "22.11";

  home.packages = with pkgs; [

    brave # main browser
    firefox # backup browser

    thunderbird-bin
    libsForQt5.korganizer
    libsForQt5.kmail

    chezmoi
    seafile-client
    owncloud-client # for use with my nextcloud server (obviosly)
    syncthing
    gitoxide
    gitkraken
    nixfmt

    yt-dlp

    onlyoffice-bin
    libreoffice-qt
    trilium-desktop
    vscode
    xournalpp
    tetex
    tectonic
    lyx
    texmaker
    texlab
    pandoc # to change the format of almost anything

    # Security stuff
    keepassxc
    gnupg
    kleopatra
    element-desktop
    signal-desktop
    burpsuite
    rage
    croc
    signing-party

    vlc
    calibre

    # SSH stuff
    termius
    sshs

    libsForQt5.ark

    tealdeer # for reading easy help

    gzdoom # old doom games
    starsector # funny space game

    rnix-lsp # lsp-server written in rust
    gcc_multi
    cmake
    libtool

    gnumake
    python39
    python39Packages.pip
    rustup # complete rust toolkit
    lazygit
    neovim
    nerdfonts

    git-crypt # for transparent encryption
    ranger # command line file manager
    nodejs_20
    unzip
    yubikey-personalization
    lf
    topgrade
    virt-manager
    win-virtio

    # Databases
    sqlite
    sqlitebrowser

    syncthingtray
  ];

  imports = [ ./shell.nix ./fonts.nix ./mdbook.nix ];

  programs.micro.enable = true;

  programs.git = {
    enable = true;
    userName = "Erik Grobecker";
    userEmail = "erik@grobecker.me";
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
    enableScDaemon = true;
    enableFishIntegration = true;
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      l = "exa -l";
      doom = "~/.emacs.d/bin/doom";
      nup = "sudo nixos-rebuild switch --upgrade --flake .# --impure";
      chezmoi-git = "nvim ~/.local/share/chezmoi";
      e = "emacsclient -c";
    };
  };

  # syncthing settings
  services.syncthing = { enable = true; };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };
  programs.home-manager.enable = true;
}
