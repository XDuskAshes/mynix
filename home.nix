{ config, pkgs, spicetify-nix, ... }:

{
    home = {
        username = "dusk";
        homeDirectory = "/home/dusk";
        stateVersion = "25.11";
    };

    imports = [
        inputs.ags.homeManagerModules.default
        ./modules/home/firefox.nix
        ./modules/home/rofi.nix
        ./modules/home/neovim.nix
    ];

    xdg = {
        autostart = {
            enable = true;
        };
    };

    services.mako = {
        enable = true;
    };

    programs.ags = {
        enable = true;
        configDir = ./modules/home/extern-config/ags;
        extraPackages = with pkgs; [
            inputs.astal.packages.${pkgs.system}.battery
            fzf
        ];
    };

    home.pointerCursor = {
        enable = true;
        package = pkgs.nordzy-cursor-theme;
        name = "Nordzy";
        size = 24;
        gtk.enable = true;
        x11.enable = true;
    };

   programs.keepassxc = {
        enable = true;
        autostart = true;
    };
}
