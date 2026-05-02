{ self, inputs, ... }:

{
  flake.nixosConfigurations.cassandra = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    modules = [
      self.nixosModules.cassandraConfiguration

      inputs.home-manager.nixosModules.home-manager

      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;

        home-manager.users.dusk = {
          imports = with inputs.self.homeModules; [
            dusk
          ];
          home.stateVersion = "26.05";
        };
      }
    ];
  };
}
