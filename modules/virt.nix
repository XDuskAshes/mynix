{ config, pkgs, ... }:

{
    virtualization.libvirtd = {
        enable = true;
    };

    programs.virt-manager.enable = true;

    environment.systemPackages = with pkgs; [
        dnsmasq
    ];

    users.users.dusk.extraGroups = [ "libvirtd" ]; # I am the sole user. :p
}
