{ config, pkgs, ... }:

{
  # Installing the packages for the shell
  home.packages = with pkgs; [
    fish # the shell I use
    lsd # ls but in rust and better
    ripgrep # grep but in rust
    fd # alternative to find using rust
    thefuck # autocorrection of previous command using "fuck" as init
    alacritty # better terminal
    btop # top but better and faster
    bat # better cat command
    lf # to use for file management
    direnv # to manage my shell enviroment
    taskwarrior # cli-based task manager
    taskwarrior-tui # to have a tui for taskwarrior
    bat-extras.batman # to use bat for reading man pages
    manix # to search through everything nix related fast
    vim-full # for qutebrowser-qt6 to use gvim
    nb # for quickly writing notes in my terminal
    fzf # for making everything a tad fuzzy

    fishPlugins.fzf # to have fuzzy everything in fish
    fishPlugins.forgit # to have fuzzy interactive git commands in fish
    fishPlugins.github-copilot-cli-fish # to use github copilot in fish
    fishPlugins.sponge # to remove those pesky errors in my commands from history
  ];
  programs.neovim.defaultEditor = true;
  programs.alacritty.settings = {
    env = { TERM = "alacritty"; };
    window.dimensions = {
      columns = 210;
      lines = 47;

    };
    window.decorations = "full";
    font = { normal.family = "FiraCode Nerd Font"; };
  };

  home.sessionVariables = { EDITOR = "emacsclient -c -a 'emacs'"; };
}
