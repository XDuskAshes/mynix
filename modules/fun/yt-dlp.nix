{ config, pkgs, ... }:

{
    imports = [ ./../dev/python/python.nix ];
    environment.systemPackages = with pkgs; [
        # JS runtimes.
        # By default, Deno gets used.
        # However if we need others they'll be here.
        bun
        deno
    ];
}
