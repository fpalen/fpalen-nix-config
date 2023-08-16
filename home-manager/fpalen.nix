{ pkgs, lib, ... }:
let
  
  isDarwin = pkgs.stdenv.isDarwin;
  isLinux = pkgs.stdenv.isLinux;
in
{

  imports = [
    ./fonts
    ./cli
    ./gui
  ];



  programs.home-manager.enable = true;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.fish.enable =  true;

  home.packages = with pkgs;[ 
    zsh
    fish
  ] ++ ( lib.optionals isDarwin [
    iterm2
  ]);

  programs.git = {
    enable = true;
    userName = "fpalen";
    userEmail = "fpalen@gmail.com"; 
    aliases = {
      prettylog = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
      st = "status";
    };
    extraConfig = {
      branch.autosetuprebase = "always";
      color.ui = true;
      core.askPass = ""; # needs to be empty to use terminal for ask pass
      credential.helper = "store"; # want to make this more secure
      github.user = "fpalen";
      push.default = "tracking";
      init.defaultBranch = "main";
    };
  };

  programs.tmux = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-ceintl.vscode-language-pack-es
      bbenoist.nix
      # vscode-extensions.arcticicestudio.nord-visual-studio-code
      # redhat.ansible
      ms-azuretools.vscode-docker
      # ms-vscode-remote.remote-containers
      ms-vscode-remote.remote-ssh
      # ms-vscode-remote.remote-ssh-edit
      # ms-vscode.remote-explorer
      # ms-vscode-remote.vscode-remote-extensionpack
  ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [  ];
};

  home.stateVersion = "23.05";
}
