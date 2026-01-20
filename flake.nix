{
    # following along with a video by LibrePhoenix: https://www.youtube.com/watch?v=ACybVzRvDhs
    description = "Dusk's NixOS Config Flake";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable"; # 90% just because im used to arch being rolling. love me some rolling release.
        spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    };
    outputs = { self, nixpkgs, ... }:
    let
        system = "x86_64-linux";
        pkgs = import nixpkgs { inherit system; };
        lib = pkgs.lib;
    in {
        nixosConfigurations = {
            nixtester = lib.nixosSystem {
                inherit system;
                modules = [
                    ./configuration.nix
                    ./modules/apps/media/spotify.nix
                ];

                specialArgs = { inherit spicetify-nix; };
            };
        };
    };
}
