{ config, lib, pkgs, ... }:

let
    cfg = config.games.minecraft;
in
{
    options.games.minecraft = {
        enable = lib.mkEnableOption "Minecraft (Prism Launcher)";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = [
            pkgs.prismlauncher
        ];
    };
}
