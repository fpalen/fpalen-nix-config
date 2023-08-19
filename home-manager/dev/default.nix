{ pkgs, ... }: {
  imports = [
    #
  ];

  home.packages = with pkgs; [
    stow
    ansible
    ansible-lint
    pandoc
    bat
    ripgrep
    jq
    nixfmt # Nix formatter
    inetutils #telnet
    zip
    unzip
    rar
    git-crypt
  ];
}
