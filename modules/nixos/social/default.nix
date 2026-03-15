{ config, pkgs, ... }:

{
    imports = [
        ./discord.nix
        ./xmpp.nix
    ];
}
