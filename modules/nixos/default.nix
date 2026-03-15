{ config, pkgs, ... }:

{
    imports = [
        ./social
        ./games
        ./media
        ./wmde

        ./content.nix
    ];
}
