{ config, pkgs, ... }:

{
    imports = [
        ./mpv.nix
        ./vlc.nix
        ./strawberry.nix
    ];
}
