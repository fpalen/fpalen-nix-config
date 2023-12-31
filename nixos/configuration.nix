# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ inputs, outputs, lib, config, pkgs,... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

      nixpkgs = {
      config = {
        allowUnfree = true;
        allowBroken = true;
      };
    };

  nix = {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };

  security.sudo.wheelNeedsPassword = false;
  security.polkit.enable = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.mutableUsers = false;

  users.users.root = {
    password = "!";
  };

  users.users.fpalen = {
    isNormalUser = true;
    hashedPassword = "$6$eZilnPK9eA9MP8Bt$09cIzBYkDxxT3mXhk9.G7MFcBjlUG.cCo8nXLYm0BlsUy5rpfNV71AbX5mydS8mby3yJL11dNqh9054cw9I2Q0";
    extraGroups = [ "wheel" "video" ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDhVHiKW87+HBOq6blsJ+yv0q7CfrmjGcu3nY9SZ9TLMUMIPoOAZ+GkSbm0tfp8BxRTCMasilYgr0edf8PhTUreH4Vemv/iKgrgZI0nc+9m3HBHxmqTnWL1LSC/ePx0sNr3XMaGAgl9PXNR2F2PorzjaTjhaf/LAYr+cWAVSlpDtYJRsDqnN0NcvyH3HuxwqHvuetdOOTULsBUx+Kk/V++LqZrVxYaXV2nHdBqR6SWNSWqnWO4vVgjJIspabRP8JQJUjsPXvMCIDdtHGggdBIYm8UZb58BaJehQX86FZQEo31JBhFy+ucx5kLi0fYlKkZLZidZl/rVMjN0TxC9HUC5gaW6ErA2+VfRWBzng50b4jer55vkDHHRL7EiBAwN/FoMZQeIuEkTgbaQfRt0o17Vut83WJtbTrfAAMwtpKbgDOrMzTranb+gCb3VgdEHnh31AO6z8USrXHlrSOwTBvfZL150PkKSQ/g+//JoL0e5sPYeNYZay/aPRUdy4GlrLHSE= fpalen"
    ];
  };

  environment.variables = {
    MOZ_ENABLE_WAYLAND = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    htop
    git
    mkpasswd
    bash
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  ######### PROGRAMS ########
  programs.regreet = {
    enable = true;
  }; 

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --asterisks --cmd sway";
      };
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

