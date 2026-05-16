{ self, ... }:

{
  flake.nixosModules.hyprland =
    { pkgs, ... }:
    {
      imports = with self.nixosModules; [
        basewl
        waylandwmtools
      ];

      programs.hyprland = {
        enable = true;
        xwayland.enable = true;
      };

      environment.systemPackages = with pkgs; [
        hyprpaper
        quickshell
        elephant
        walker
      ];
    };
}
