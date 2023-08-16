{ config, pkgs, lib, ... }:

{
    nixpkgs = {
      config = {
        allowUnfree = true;
        allowBroken = true;
      };
    };



  
  users.users.fpalen = {
    shell = pkgs.fish;
    home = "/Users/fpalen";
  };



  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    coreutils
    vim
    wget
    curl
    htop
    git
    mkpasswd
    # zsh
    # fish
    # bash
    openssh
    openssl
  ];

  homebrew.enable = true;
    homebrew.onActivation = {
    autoUpdate = true;
    cleanup = "zap";
    upgrade = true;
  };

  homebrew.brews = [
  ];
    
  homebrew.casks = [
    "displaylink"
    # "iterm2"
    "Obsidian"
    "parallels"
    "google-chrome"
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  nix = {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  programs.fish.enable = true;
  programs.bash.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-darwin";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
