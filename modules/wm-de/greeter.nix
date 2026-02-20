{ config, lib, pkgs, ... }:

{
    services.greetd = {
        enable = true;
        settings = {
            default_session = "${pkgs.tuigreet}/bin/tuigreet --time";
            user = "greeter";
        };
    };
} 
