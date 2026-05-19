{ self, ... }:
{
  flake.nixosModules.group-contentcreation =
    { ... }:
    {
      imports = with self.nixosModules; [
        audacity
        obs-studio
        kdenlive
      ];
    };
}
