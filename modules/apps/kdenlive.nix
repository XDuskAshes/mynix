{ ... }:
{
  flake.nixosModules.kdenlive =
  { pkgs, ... }:
  {
    environment.systemPackages = with pkgs; [ kdenlive ];
  };
}
