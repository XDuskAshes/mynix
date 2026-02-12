# This file is just a bunch of packages for Wayland WMs like Niri, Hyprland, etc.

{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        swaylock
        swaybg
        swayidle
        grim
        slurp
        xwayland-satellite
        mako
        wl-clipboard
    ];
}
