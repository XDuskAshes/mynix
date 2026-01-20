{ config, lib, pkgs, ... }:

let
    cfg = config.wmde.plasma;
in
{
    options = {
        wmde.plasma.enable = lib.mkOption {
            default = false;
            type = with lib.types; bool;
            description = "Enable/Disable KDE Plasma and its particulars.";
        };
    };

    config = lib.mkIf cfg.enable {
        import = [ ../basewl.nix ];

        services.desktopManager.plasma6 = {
            enable = true;
            notoPackage = pkgs.noto-fonts;
        };

        environment.systemPackages = with pkgs.kdePackages; [
            dolphin
            ark
            spectacle
        ];

        environment.plasma6.excludePackages = with pkgs.kdePackages; [
            elisa
            discover
        ];
    };
}
