{ ... }:

{
  flake.nixosModules.spotify =
    { inputs, pkgs, ... }:

    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      programs.spicetify = {
        enable = true;
        theme = spicePkgs.themes.catppuccin;
        colorScheme = "mocha";
        enabledExtensions = with spicePkgs.extensions; [
          adblockify
          shuffle
          volumePercentage
        ];
      };
    };
}
