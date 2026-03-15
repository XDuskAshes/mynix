{ config, pkgs, ... }:

{
    boot.loader = {
        limine = {
            enable = true;
            efiSupport = true;
            enableEditor = false;
            maxGenerations = 10;
        };

        efi.canTouchEfiVariables = false;
    };
}
