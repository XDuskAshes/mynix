{ ... }:
{
  flake.nixosModules.obs-studio =
    { pkgs, ... }:
    {
      programs.obs-studio = {
        enable = true;
        package = pkgs.obs-studio;
      };
    };
}
