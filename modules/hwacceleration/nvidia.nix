{ config, pkgs, ... }:

{
    # I only want this enabled if we're pulling
    # this module so that hardware acceleration
    # being on doesn't do some strange "best-effort"
    # thing in future updates. Call it future-proofing
    # or something to that effect.
    hardware.graphics.enable = true;

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
        open = false;
        modesetting.enable = true;
        nvidiaSettings = true;
    };
}
