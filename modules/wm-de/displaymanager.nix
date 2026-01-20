{ config, lib, pkgs, ... }:

{
    # This file is just for display manager stuff.
    
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true; # wayland support
        settings = {
            General = {
                DisplayServer = "wayland"; # enforces wayland.. i think.
            };
        };
    };
} 
