{ ... }:
{
  flake.nixosModules.discord =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        (discord.override {
          withVencord = false; # 06-12-2026: Package is fucked!
          withOpenASAR = true; # 06-12-2026: Package is fixed!
        })
      ];
    };
}
