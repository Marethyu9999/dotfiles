{config, pkgs, ...}:

{
  # Installing the packages for the shell
  home.packages = with pkgs; [
    fish  # the shell I use
    exa   # ls but in rust and better
    ripgrep  # grep but in rust
    ripgrep-all  # ripgrep but also for stuff in files
    fd  # alternative to find using rust
    thefuck  # autocorrection of previous command using "fuck" as init
    alacritty  # better terminal
    btop  # top but better and faster
    bat  # better cat command
    lf  # to use for file management
    direnv  # to manage my shell enviroment
    taskwarrior # cli-based task manager
    taskwarrior-tui  # to have a tui for taskwarrior
    bat-extras.batman  # to use bat for reading man pages
  ];
  programs.neovim.defaultEditor = true;
  programs.alacritty.settings = {
    env = {
      TERM = "alacritty";
    };
    window.dimensions = {
      columns = 210;
      lines = 47;

    };
    window.decorations = "full";
    font = {
      normal.family = "InconsoloataGo Nerd Font";
    };
  };
  home.sessionVariables = {
      EDITOR = "~/.local/bin/lvim";
    };
}
