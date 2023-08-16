{ config, lib, pkgs, ... }:

let

in {
  imports = [
    ./common
  ] ++ (lib.optionals isLinux [
    ./hyprland
    ./sway
  ]);
}
