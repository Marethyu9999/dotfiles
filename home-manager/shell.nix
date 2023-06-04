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
  ];
  programs.fish = {
    enable = true;
    shellAliases = {
        l = "exa -l";
        hup = "home-manager switch";
        aup = "topgrade";
        nup = "sudo nixos-rebuild switch";
        doom = "~/.emacs.d/bin/doom";
        edit = "emacs";
        chezmoi-git = "nvim ~/.local/share/chezmoi";
    };
  };
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
      EDITOR = "nvim";
    };
}
