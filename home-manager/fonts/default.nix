{ pkgs, ... }: {
  imports = [
    #
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    fira-code
    fira-code-symbols
    # fira-code-nerd-font
    hack-font
    # hack-nerd-font
    (nerdfonts.override { fonts = [ 
      "FiraCode"
      "Hack"
      ]; })
  ];
}
