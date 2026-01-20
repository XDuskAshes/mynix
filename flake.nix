{
    # following along with a video by LibrePhoenix: https://www.youtube.com/watch?v=ACybVzRvDhs
    description = "Dusk's NixOS Config Flake";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable"; # 90% just because im used to arch being rolling. love me some rolling release.
        spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    };
    outputs = { self, nixpkgs, ... }:
    let
        lib = nixpkgs.lib;
        pkgs = import nixpkgs { inherit system; };
        spicePkgs = spicetify-nix.legacyPackages.${system};
    in {
        nixosConfigurations = {
            nixtester = lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./configuration.nix

                    spicetify-nix.nixosModules.default
                ];
                configuration = {
                    nixpkgs.config.allowUnfree = true;

                    programs.spicetify = {
                        enable = true;
                        enabledExtensions = with spicePkgs.extensions; [
                           adblockify
                           shuffle
                           volumePercentage
                        ];
                    };
                };
            };
        };
    };
}
