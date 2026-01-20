{ pkgs, inputs, ... }:

{
    import = [ inputs.spicetify-nix.nixosModules.spicetify ];
    programs.spicetify = {
        let
            spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
        in
        {
            enable = true;
            theme = spicePkgs.themes.onepunch;
            enabledExtensions with spicePkgs.extensions; [
                adblockify
                shuffle
                volumePercentage
            ];
        }
    };
}
