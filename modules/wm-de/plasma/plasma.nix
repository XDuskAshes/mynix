{ config, lib, pkgs, ... }:

with lib;

{
    options.doPlasma = {
        enable = mkOption; {
            type = types.bool;
            default = false;
            description = "Enable KDE Plasma and it's particulars.";
        };
    };

    config = mkIf config.doPlasma.enable {
        services.desktopManager.plasma6 = {
            enable = true;
            notoPackage = pkgs.noto-fonts;
        };

        environment.systemPackages = with pkgs.kdePackages; [
            dolphin
            ark
            systemsettings
            spectacle
        ];

        environment.plasma6.excludePackages = with pkgs.kdePackages; [
            elisa
            discover
            kwrite

        ];
    };
};
