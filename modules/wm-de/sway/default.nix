{ config, pkgs, ... }:

let
    cfg = config.wmde.sway;
in
{
    options = {
        wmde.sway.enable = lib.mkOption {
            default = false;
            type = with lib.types; bool
            description = "Enable/Disable Sway WM."
        };
    };

    config = lib.mkIf cfg.enable {

        imports = [
            ../basewl.nix
            ../waylandwmtools.nix
        ];

        environment.systemPackages = with pkgs; [
            sway
        ];

        programs.sway = {
            enable = true;
            xwayland = {
                enable = true;
            };
        };
    }
}
