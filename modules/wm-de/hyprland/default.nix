{ config, lib, pkgs, ... }:

let
    cfg = config.wmde.hyprland;
in
{
    options = {
        wmde.hyprland.enable = lib.mkOption {
            default = false;
            type = with lib.types; bool;
            description = "Enable/Disable Hyprland and its particulars.";
        };
    };
    
    imports = [
        ../basewl.nix
        ../waylandwmtools.nix
    ];

    config = lib.mkIf cfg.enable {
        programs.hyprland = {
            enable = true;
            xwayland = {
                enable = true;
            };
        };

        environment.sessionVariables = {
            WLR_NO_HARDWARE_CURSORS = "1";
            NIXOS_OZONE_WL = "1";
        };

        environment.systemPackages = with pkgs; [
            kitty
            hyprpaper
        ];
    };
}
