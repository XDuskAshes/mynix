{ inputs, ... }:
{
  flake.nixosModules.revoLang =
    { pkgs, ... }:
    {
      nixpkgs.overlays = [
        inputs.revo.overlays.default
      ];

      environment.systemPackages = [ pkgs.revo ];
    };
}
