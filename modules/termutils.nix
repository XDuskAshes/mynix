{ config, pkgs, ... }:

{
    # Terminal utilities.
    # These are mostly just good/useful tools to have.
    environment.systemPackages = with pkgs; [
        tree
        htop
        ffmpeg
        wget
        btrfs-progs
        zoxide
        stow
        fzf
        git
    ];
}
