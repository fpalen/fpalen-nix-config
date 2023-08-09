{ lib, config, pkgs, ... }: {
  imports = [
    ../wofi
    ../waybar
  ];

  home.packages = with pkgs; [
    # 
  ];

  wayland.windowManager.sway = {
    enable = true;
    # extraOptions = [ "--unsupported-gpu " ];
    config = rec {
      modifier = "Mod4";
      keybindings = {
        "Ctrl+Space" = "exec wofi --show drun";
      };
      bars = [ 
        {
          command = "waybar";
        }
      ];
    };
    extraConfig = ''
       output Virtual-1 scale 0.5
       output Virtual-1 resolution 1920x1080
       input * {
         accel_profile flat
         pointer_accel -0.5
      }
    '';
  };
}
