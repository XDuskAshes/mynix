{ config, lib, pkgs, ... }:

{
    imports = [
        ./../basewl.nix 
    ];

    programs.niri = {
        enable = true;
    };
}
