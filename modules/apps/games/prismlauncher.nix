{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        (prismlauncher.override {
            additionalPrograms = [ ffmpeg ];
            # jdks = []; # will uncomment when i need more of these
        })
    ];
}
