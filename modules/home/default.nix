{ ... }:

{
  flake.homeModules.dusk =
    { pkgs, ... }:
    {
      imports = [
        ./_firefox.nix
        ./_neovim.nix
        ./_keepassxc.nix
        ./_zed.nix
        ./_spotify.nix
      ];

      home.pointerCursor = {
        enable = true;
        package = pkgs.catppuccin-cursors.mochaLavender;
        name = "Catppuccin Mocha";
        size = 24;
        gtk.enable = true;
        x11.enable = true;
      };

      xdg.autostart.enable = true;
      services.mako.enable = true;
    };
}
