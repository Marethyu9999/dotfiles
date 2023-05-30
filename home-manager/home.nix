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

    termius
    sshs

    libsForQt5.ark

    tealdeer

    gzdoom
    starsector

    rnix-lsp
    gcc_multi
    cmake
    libtool

    #gnumake
    python39
    python39Packages.pip
    # nodejs-19_x
    cargo
    lazygit
    neovim
    nerdfonts
    
    git-crypt
    ranger
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

  programs.home-manager.enable = true;
}
