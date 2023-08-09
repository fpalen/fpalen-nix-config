{ pkgs, lib, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.fpalen = {
      bookmarks = {};
      settings = {
        "browser.startup.homepage" = "https://start.duckduckgo.com";
	"extensions.pocket.enabled" = false;
      };
    };
  };
}
