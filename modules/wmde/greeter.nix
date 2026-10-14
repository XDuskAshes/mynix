{ ... }:
{
  flake.nixosModules.greeter =
    { pkgs, inputs, ... }:
    {
      imports = with inputs; [
        noctalia-greeter.nixosModules.default
      ];

      programs.noctalia-greeter = {
        enable = true;
        greeter-args = "--session Hyprland";
      };
    };
}
