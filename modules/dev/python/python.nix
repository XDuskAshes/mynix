{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        python3
        python313Packages.pip
    ];
}
