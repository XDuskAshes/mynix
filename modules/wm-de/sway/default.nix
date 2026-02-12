{ config, lib, pkgs, ... }:

let
    cfg = config.wmde.sway;
in
{
    options = {
        wmde.sway.enable = lib.mkOption {
            default = false;
            type = with lib.types; bool;
            description = "Enable/Disable Sway WM.";
        };
    };
 
    imports = [
       ../basewl.nix
       ../waylandwmtools.nix
    ];

   
    config = lib.mkIf cfg.enable {
        services.seatd = {
            enable = true;
        };
        services.gnome.gnome-keyring.enable = true;
        
        environment.systemPackages = with pkgs; [
            sway
            seatd
        ];

        programs.sway = {
            enable = true;
            xwayland = {
                enable = true;
            };
        };
    };
}
