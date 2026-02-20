{ config, pkgs, ... }:

{
    imports = [
        ./niri
        ./plasma
        ./displaymanager.nix
    ];
}
