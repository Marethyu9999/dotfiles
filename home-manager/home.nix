{ config, pkgs, ... }:

{

  home.username = "marethyu";
  home.homeDirectory = "/home/marethyu";

  home.stateVersion = "22.11";

  home.packages = with pkgs; [

    brave  # main brothwser
    firefox  # backup browser

    thunderbird-bin

    chezmoi
    seafile-client
    gitoxide

    yt-dlp

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
    rustup  # complete rust toolkit
    lazygit
    neovim
    nerdfonts
    
    git-crypt  # for transparent encryption
    ranger  # command line file manager
    nodejs_20
    unzip
    yubikey-personalization
    lf
    topgrade
  ];

  imports = [
    ./shell.nix
    ./fonts.nix
    ./mdbook.nix
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
        aup = "topgrade";
        nup = "sudo nixos-rebuild switch --upgrade --flake .# --impure";
        doom = "~/.emacs.d/bin/doom";
        chezmoi-git = "nvim ~/.local/share/chezmoi";
        lvim = "/home/marethyu/.local/bin/lvim";
    };
  };


  programs.home-manager.enable = true;
}
