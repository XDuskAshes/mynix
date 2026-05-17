{ ... }:
{
  flake.nixosModules.discord =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        (discord.override {
          withVencord = true; # 05-05-2026: Package is fixed!
          withOpenASAR = false; # 05-16-2026: Package is fucked!
        })
      ];
    };
}
