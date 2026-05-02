{ ... }:
{
  flake.nixosModules.basewl =
    { pkgs, ... }:
    {
      programs.xwayland.enable = true;
      environment.systemPackages = with pkgs; [
        xwayland-satellite
      ];
      environment.sessionVariables = {
        NIXOS_OZONE_WL = 1;
      };
    };
}
