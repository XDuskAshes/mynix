{ config, lib, pkgs, ... }:

let
    cfg = config.wmde.sway;
in
{
    options = {
        wmde.sway.enable = lib.mkOption {
            default = false;
            type = with lib.types; bool;
            description = "Enable/Disable Sway.";
        };
    };
    
    imports = [
        ../basewl.nix
        ../waylandwmtools.nix
    ];

    config = lib.mkIf cfg.enable {
        services.gnome.gnome-keyring.enable = true;
        programs.sway = {
            enable = true;
            wrapperFeatures.gtk = true;
        };
    };
}
