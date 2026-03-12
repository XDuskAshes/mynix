{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        gajim
    ]
}
