{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        fluffychat # element kinda clunky
    ];
}
