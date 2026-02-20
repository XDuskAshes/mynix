{ config, pkgs, ... }:

{
    imports = [
        ./plasma
        ./hyprland
        ./greeter.nix
    ];
}
