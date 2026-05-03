{ ... }:
{
  flake.nixosModules.cassandraHardwareAcceleration =
    { ... }:
    {
      services.xserver.videoDrivers = [ "nvidia" ];

      hardware = {
        opengl = {
          enable = true;
        };
        graphics = {
          enable = true;
          enable32Bit = true;
        };
        nvidia = {
          open = true;
          nvidiaSettings = true;
          modesetting = {
            enable = true;
          };
        };
      };
    };
}
