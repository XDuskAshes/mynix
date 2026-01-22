{ pkgs, ... }:

{
    fonts = {
        packages = with pkgs; [
            nerd-fonts.jetbrains-mono
            noto-fonts-color-emoji
            noto-fonts-emoji-blob-bin
            liberation_ttf
            nerd-fonts.hack
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
}
