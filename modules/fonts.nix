{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        noto-fonts-color-emoji
        noto-fonts-emoji-blob-bin
        liberation_ttf
        nerd-fonts.hack
    ];

    fonts = {
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
