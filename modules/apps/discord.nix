{ ... }:
{
  flake.nixosModules.discord =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        (discord.override {
          withVencord = false;
          withOpenASAR = true;
        })
      ];
    };
}
