{ config, pkgs, ... }:

{
    programs.obs-studio = {
        enable = true;
        enableVirtualCamera = true;
        plugins = {
            # In case I ever need any.
        };
    };
}
