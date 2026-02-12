{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        element-desktop # electronslop i know but it's what'll work for me
    ];
}
