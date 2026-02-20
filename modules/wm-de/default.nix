{ config, pkgs, ... }:

{
    imports = [
        ./niri
        ./plasma
        ./sway # Fingers crossed!
        ./greeter.nix
    ];
}
