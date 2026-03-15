{ config, lib, pkgs, ... }:

let
    cfg = config.social.discord;
in
{
    options.social.discord = {
        enable = lib.mkEnableOption "Enable/Disable Discord. Comes with OpenASAR and Vencord.";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = [
            (pkgs.discord.override {
                withOpenASAR = true;
                withVencord = true;
            })
        ];
    };
}
