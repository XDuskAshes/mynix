{ config, lib, pkgs, ... }:

{
    # This file is used as a base for all Wayland DEs/WMs, mostly Niri.
    # It mostly includes xwayland stuff, used for things like Discord and Steam,
    # both of which are things I use. Does not do much outside of that.

    programs.xwayland = {
        enable = true;
    };

    environment.systemPackages = with pkgs; [
        xwayland-satellite
    ];
}
