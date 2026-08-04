{ ... }:
{
  flake.nixosModules.steam =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [ steam ];

      programs.steam = {
        enable = true;
        protontricks = {
          enable = true;
          package = pkgs.protontricks;
        };
      };
    };
}
