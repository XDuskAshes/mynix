{
    # following along with a video by LibrePhoenix: https://www.youtube.com/watch?v=ACybVzRvDhs
    description = "Dusk's NixOS Config Flake";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable"; # 90% just because im used to arch being rolling. love me some rolling release.
    };
    outputs = { self, nixpkgs, ... }:
    let
        lib = nixpkgs.lib;
    in {
        nixosConfigurations = {
            nixtester = lib.nixosSystem {
                system = "x86_64-linux";
                modules = [ ./configuration.nix ];
            };
        };
    };
}
