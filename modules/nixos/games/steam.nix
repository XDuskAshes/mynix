{ config, lib, pkgs, ... }:

let
    cfg = config.games.steam;
in
{
    options.games.steam = {
        enable = lib.mkEnableOption "Steam";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = [
            pkgs.steam
        ];
    };
}
