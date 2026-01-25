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
            mako # NOTE: Working on getting this working.
                 # Do I need to disable KDE? Or something? Weird shit.
                 # 
                 # ~ ><> mako
                 # Failed to acquire service name: File exists
                 # Is a notification daemon already running?
                 # 
                 # What other notification daemon?
            swayidle
            swaybg
            grim
            slurp
            xwayland-satellite
            quickshell

            rofi
            rofi-calc
        ];
    };
}
