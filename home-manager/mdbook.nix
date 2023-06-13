{config, pkgs, ...}:

{
  home.packages = with pkgs; [
    mdbook
    mdbook-d2
    mdbook-katex
    mdbook-mermaid
    mdbook-plantuml
    mdbook-graphviz
    mdbook-admonish
  ];
}