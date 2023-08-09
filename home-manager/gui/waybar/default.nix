{ config, lib, pkgs, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 40;
        modules-left = [];
        modules-center = [ "clock" ];
        modules-right = [];
      };
    };
  };
}
