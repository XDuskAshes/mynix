{ config, pkgs, ... }:

{
    home = {
        username = "dusk";
        homeDirectory = "/home/dusk";
        stateVersion = "25.11";
    };

    programs.fish = {
        enable = true;
    };
}
