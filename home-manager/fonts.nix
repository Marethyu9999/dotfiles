{pkgs, config, ...}:

{
    home.packages = with pkgs; [
        hasklig
    ];
}