{ config, lib, pkgs, ... }:

let
    cfg = config.content_tools;
in
{
    options.content_tools = {
        enable = lib.mkEnableOption "Content creation tools";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = [
            pkgs.audacity
            pkgs.kdenlive
            pkgs.obs-studio
        ];
    };
}
