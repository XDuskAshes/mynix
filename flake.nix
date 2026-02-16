{
    description = "Dusk's NixOS Config Flake";

    inputs = {
        nixpkgs = {
            url = "github:nixos/nixpkgs/nixos-unstable"; # 90% just because im used to arch being rolling. love me some rolling release.
        };

        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        spicetify-nix = {
            url = "github:Gerg-L/spicetify-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs =
        {
            self,
            nixpkgs,
            home-manager,
            spicetify-nix,
            ...
        }@inputs:
        {
            nixosConfigurations.nixie = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit inputs spicetify-nix; };

                modules = [
                    ./configuration.nix
                    ./modules/apps/media/spotify.nix

                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                        useUserPackages = true;
                        backupFileExtension = "home-manager_backup";
                        extraSpecialArgs = { inherit inputs; };
                        users.dusk = {
                            imports = [
                                ./home.nix
                                inputs.nvf.homeManagerModules.default
                            ];
                        };
                    };
                }
            ];
        };
    };
}
