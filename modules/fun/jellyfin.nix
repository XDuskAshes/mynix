{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        jellyfin
        jellyfin-desktop
    ];
}
