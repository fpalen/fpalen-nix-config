{ lib, config, pkgs, ... }: {
  imports = [
    #
  ];

  home.packages = with pkgs; [
    # 
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      general = {
        #
      };
      input = {
        #
      };
    };
  };

}
