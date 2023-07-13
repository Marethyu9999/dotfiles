{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ hasklig open-sans manrope];
}
