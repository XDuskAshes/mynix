{ pkgs, inputs, ... }:

{
    import = [ spicetify-nix.nixosModules.spicetify ];

    let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    programs.spicetify = {
        enable = true;
        theme = spicePkgs.themes.onepunch;
        enabledExtentions = with spicePkgs.extensions; [
            adblockify
            shuffle
            volumePercentage
        ];
    };
}
