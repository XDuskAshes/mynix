{
    description = "Dusk's NixOS Flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
        system = "x86_64-linux";
    in
    {
        nixosConfigurations = {
            desktop = nixpkgs.lib.nixosSystem {
                inherit system;

                specialArgs = { inherit inputs; };

                modules = [
                    ./hosts/desktop
                    home-manager.nixosModules.home-manager

                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPkgs = true;

                        home-manager.users.dusk =
                            import ./users/dusk/home.nix
                    }
                ];
            };
        };
    };
}
