{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    extensions = [
      "catppuccin"
      "nix"
      "html"
      "make"
      "lua"
    ];
    extraPackages = with pkgs; [
      nixd
      lua-language-server
    ];
    userSettings = {
      disable_ai = true;
      telemetry.metrics = false;
      languages = {
        Nix = {
          language_servers = [ "nixd" ];
        };
        Lua = {
          language_servers = [ "lua-language-server" ];
        };
      };
    };
  };
}
