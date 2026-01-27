{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        python3
        python313packages.pip
    ];
}
