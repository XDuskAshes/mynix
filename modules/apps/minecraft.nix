{ ... }:
{
  flake.nixosModules.minecraft =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        (prismlauncher.override{
          additionalPrograms = [ ffmpeg ];
        })
      ];
    };
}
