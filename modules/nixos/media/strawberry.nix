{ config, lib, pkgs, ... }:

let
    cfg = config.media.music.strawberry;
in
{
    options.media.music.strawberry = {
        enable = lib.mkEnableOption "Strawberry music player";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = [
            pkgs.strawberry
        ];
    };
}
