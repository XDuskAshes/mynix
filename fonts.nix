{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-color-emoji
        noto-fonts-emoji-blob-bin
        nerd-fonts.jetbrains-mono
        liberation_ttf
    ];

    fonts = {
        fontDir.enable = true;
        fontconfig = {
            enable = true;
            defaultFonts = {
                serif = [ "Liberation Serif" ];
                sansSerif = [ "Liberation Sans" ];
                monospace = [ "JetBrains Mono" ];
                emoji = [ "Noto Color Emoji" ];
            };
        };
    };
}
