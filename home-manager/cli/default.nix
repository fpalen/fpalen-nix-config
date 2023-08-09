{ pkgs, ... }: {
  imports = [
    #
  ];

  home.packages = with pkgs; [
    nixfmt # Nix formatter
  ];
}
