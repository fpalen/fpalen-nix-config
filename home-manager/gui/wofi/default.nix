{ config, lib, pkgs, ... }: {
  programs.wofi = {
    enable = true;
    settings = {
      image_size = 12;
      allow_images = true;
      insensitive = true;
    };
  };
}
