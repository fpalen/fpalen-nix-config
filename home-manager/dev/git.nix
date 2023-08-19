{ pkgs, lib, inputs, ... }:

{
  programs.git = {
    enable = true;
    userName = "fpalen";
    userEmail = "fpalen@gmail.com";
    aliases = {
      prettylog =
        "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
      st = "status";
    };
    delta = {
      enable = true;
      options = {
        navigate = true;
        line-numbers = true;
        syntax-theme = "GitHub";
      };
    };
    extraConfig = {
      core.editor = "nvim";
      branch.autosetuprebase = "always";
      color.ui = true;
      core.askPass = ""; # needs to be empty to use terminal for ask pass
      credential.helper = "store"; # want to make this more secure
      github.user = "fpalen";
      push.default = "tracking";
      init.defaultBranch = "main";
    };
    ignores = [ ".DS_Store" "*.pyc" ];
  };
}
