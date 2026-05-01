{ ... }:

{
  flake.nixosModules.termutils =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        tree
        htop
        ffmpeg
        wget
        zoxide
        stow
        fzf
        git
      ];
    };
}
