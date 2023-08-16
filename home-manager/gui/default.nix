{ config, lib, pkgs, ... }:

let
  isDarwin = pkgs.stdenv.isDarwin;
  isLinux = pkgs.stdenv.isLinux;
in {
  imports = [
    ./common
  ] ++ (lib.optionals isLinux [
    ./hyprland
    ./sway
  ]);
}
