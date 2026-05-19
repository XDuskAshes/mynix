{ ... }:
{
  flake.nixosModules.kdenlive =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs.kdePackages; [ kdenlive ];
    };
}
