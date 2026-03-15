{ config, lib, pkgs, ... }:

let
    cfg = config.social.xmpp;
in
{
    options.social.xmpp = {
        enable = lib.mkEnableOption "XMPP Client (Gajim)";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = [
            pkgs.gajim
        ];
    };
}
