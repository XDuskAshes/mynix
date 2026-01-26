{ config, lib, pkgs, ... }:

let
    cfg = config.wmde.niri;
in
{
    options = {
        wmde.niri.enable = lib.mkOption {
            default = false;
            type = with lib.types; bool;
            description = "Enable/Disable Niri and other things that are good with it.";
        };
    };
    
    imports = [
        ../basewl.nix
    ];

    config = lib.mkIf cfg.enable {
        programs.niri.enable = true;
        security.polkit.enable = true;
        services.gnome.gnome-keyring.enable = true; # Oh GNOME how your beautiful face turns corner before your fugly form.. kick so many rocks.
        environment.systemPackages = with pkgs; [
            fuzzel
            swaylock
            mako
            swayidle
            swaybg
            grim
            slurp
            xwayland-satellite
            quickshell
            wl-clipboard
        ];
    };
}
