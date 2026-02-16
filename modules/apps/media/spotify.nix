{ config, pkgs, spicetify-nix, ... }:

let
    spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
in {
    imports = [
        spicetify-nix.nixosModules.spicetify
    ];
    programs.spicetify = {
        enable = true;
        theme = spicePkgs.themes.onepunch;
        enabledExtensions = with spicePkgs.extensions; [
            adblockify
            shuffle
            volumePercentage
        ];
    };
}
