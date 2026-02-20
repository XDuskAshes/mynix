{ config, pkgs, ... }:

{
    imports = [
        ./niri
        ./plasma
        # Eventually, as niri is giving me headaches
        # and Hyprland is too fucking hyper.
        # ./sway
        ./greeter.nix
    ];
}
