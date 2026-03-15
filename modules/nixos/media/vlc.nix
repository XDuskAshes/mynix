{ config, lib, pkgs, ... }:

let
    cfg = config.media.audiovisual.vlc;
in
{
    options.media.audiovisual.vlc = {
        enable = lib.mkEnableOption "VLC Audio/Visual player";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = [
            pkgs.vlc
        ];
    };
}
