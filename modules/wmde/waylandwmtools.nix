{ ... }:
{
  flake.nixosModules.waylandwmtools =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        swaylock
        swaybg
        swayidle
        grim
        slurp
        xwayland-satellite
        mako
        wl-clipboard
      ];
    };
}
