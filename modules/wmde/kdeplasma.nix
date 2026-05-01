{ self, ... }:
{
  flake.nixosModules.kdePlasma =
    { pkgs, ... }:
    {

      imports = [
        self.nixosModules.basewl
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
