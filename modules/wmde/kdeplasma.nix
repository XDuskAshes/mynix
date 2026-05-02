{ self, ... }:
{
  flake.nixosModules.kdePlasma =
    { pkgs, ... }:
    {

      imports = with self.nixosModules; [
        basewl
        waylandwmtools
      ];

      services.desktopManager.plasma6 = {
        enable = true;
        notoPackage = pkgs.noto-fonts;
      };

      environment.systemPackages = with pkgs.kdePackages; [
        dolphin
        ark
        spectacle
      ];

      environment.plasma6.excludePackages = with pkgs.kdePackages; [
        elisa
        discover
      ];
    };
}
