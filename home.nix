{ config, pkgs, spicetify-nix, ... }:

{
    home = {
        username = "dusk";
        homeDirectory = "/home/dusk";
        stateVersion = "25.11";
    };

    imports = [
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
