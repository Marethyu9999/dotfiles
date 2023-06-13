{ config, pkgs, ... }:

{

  home.username = "marethyu";
  home.homeDirectory = "/home/marethyu";

  home.stateVersion = "22.11";

  home.packages = with pkgs; [

    brave
    firefox

    thunderbird-bin

    chezmoi
    seafile-client
    gitoxide

    yt-dlp
    tartube-yt-dlp

    obsidian
    onlyoffice-bin

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

    tealdeer  # for reading easy help

    gzdoom  # old doom games
    starsector  # funny space game

    rnix-lsp  # lsp-server written in rust
    gcc_multi
    cmake
    libtool

    #gnumake
    python39
    python39Packages.pip
    # nodejs-19_x
    rustup
    lazygit
    neovim
    nerdfonts
    
    git-crypt
    ranger
    nodejs_20
    unzip
    yubikey-personalization
    lf
  ];

  imports = [
    ./shell.nix
    ./fonts.nix
  ];

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
        hup = "home-manager switch";
        aup = "topgrade";
        nup = "sudo nixos-rebuild switch --upgrade --flake .# --impure";
        doom = "~/.emacs.d/bin/doom";
        edit = "emacs";
        chezmoi-git = "nvim ~/.local/share/chezmoi";
        lvim = "/home/marethyu/.local/bin/lvim";
    };
  };


  programs.home-manager.enable = true;
}
