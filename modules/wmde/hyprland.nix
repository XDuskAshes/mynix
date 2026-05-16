{ self, ... }:

{
  flake.nixosModules.hyprland =
    { pkgs, inputs, ... }:
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
