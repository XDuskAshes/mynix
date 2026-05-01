{ ... }:

{
  flake.nixosModules.fonts =
    { pkgs, ... }:
    {
      fonts = {
        packages = with pkgs; [
          nerd-fonts.jetbrains-mono
          noto-fonts-color-emoji
          noto-fonts-emoji-blob-bin
          liberation_ttf
          nerd-fonts.hack
          _0xproto
          adwaita-fonts
          noto-fonts
          noto-fonts-cjk-sans
          noto-fonts-color-emoji
          ibm-plex
          inconsolata
          nerd-fonts.symbols-only
          maple-mono.variable
          departure-mono
          monaspace
          cozette
          atkinson-hyperlegible-next
          atkinson-hyperlegible-mono
          corefonts
        ];
        fontDir.enable = true;
        fontconfig = {
          enable = true;
          defaultFonts = {
            serif = [ "Liberation Serif" ];
            sansSerif = [ "Liberation Sans" ];
            emoji = [ "Noto Color Emoji" ];
          };
        };
      };
    };
}
