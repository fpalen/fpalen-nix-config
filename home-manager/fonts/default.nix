{ pkgs, ... }: {
  imports = [
    #
  ];

  home.packages = with pkgs; [
    font-fira-code
    font-fira-code-nerd-font
    font-hack
    font-hack-nerd-font
  ];
}
