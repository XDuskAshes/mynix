{ config, lib, pkgs, ... }:

let
    cfg = config.media.audiovisual.mpv;
in
{
    options.media.audiovisual.mpv = {
        enable = lib.mkEnableOption "MPV Audio/Visual player";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = [
            pkgs.mpv
        ];
    };
}
