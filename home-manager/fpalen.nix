{ pkgs, ... }:
let
  #
in
{

  imports = [
    ./cli
    ./gui
  ];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "fpalen";
    userEmail = "fpalen@gmail.com"; 
  };

  programs.tmux = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
  };

  home.stateVersion = "23.05";
}
