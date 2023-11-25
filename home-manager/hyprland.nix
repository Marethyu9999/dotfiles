{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    dunst # notifications
    swaylock-effects # screen locker
    libsForQt5.polkit-kde-agent
  ];
}
