{ self, ... }:

{
  flake.nixosModules.cassandraConfiguration =
    { pkgs, ... }:
    {
      imports = with self.nixosModules; [
        cassandraHardware
        cassandraHardwareAcceleration
        cassandraBootloader
        kdePlasma
        greeter
        fonts
        termutils
        discord
      ];

      boot.kernelPackages = pkgs.linuxPackages_zen;

      networking = {
        hostName = "cassandra";
        networkmanager.enable = true;
      };

      time.timeZone = "America/New_York";

      # Nix/Nixpkgs configuration

      nix = {
        settings = {
          experimental-features = [
            "nix-command"
            "flakes"
          ];
          auto-optimise-store = true;
        };
      };

      nixpkgs = {
        config.allowUnfree = true;
      };

      # Internationalization stuff.
      # Copied from my original generated one, what's the harm really?
      i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocaleSettings = {
          LC_ADDRESS = "en_US.UTF-8";
          LC_IDENTIFICATION = "en_US.UTF-8";
          LC_MEASUREMENT = "en_US.UTF-8";
          LC_MONETARY = "en_US.UTF-8";
          LC_NAME = "en_US.UTF-8";
          LC_NUMERIC = "en_US.UTF-8";
          LC_PAPER = "en_US.UTF-8";
          LC_TELEPHONE = "en_US.UTF-8";
          LC_TIME = "en_US.UTF-8";
        };
      };

      # Sound
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa = {
          enable = true;
          support32Bit = true;
        };
        pulse.enable = true;
      };

      # Clusterfuck central!
      services.flatpak.enable = true;
      xdg.portal.enable = true;
      xdg.autostart.enable = true;
      programs.git.enable = true;
      programs.fish.enable = true;
      users.users.dusk = {
        isNormalUser = true;
        description = "Dusk";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        packages = [ ];
        shell = pkgs.fish;
      };

      fileSystems."/mnt/SteamGames" = {
        device = "/dev/disk/by-label/SteamGames";
        fsType = "ext4";
        options = [ "defaults" ];
      };

      environment.systemPackages = with pkgs; [
        gnupg
        pinentry-qt
        fish
        zsh
        foot
        flatpak
        vlc
        fastfetch
        nordzy-cursor-theme
        strawberry
        vscodium
        easyeffects
        craftos-pc
        zoxide
        foot
      ];

      programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
        pinentryPackage = pkgs.pinentry-qt;
      };

      security = {
        sudo.enable = false;
        doas = {
          enable = true;
          extraRules = [
            {
              users = [ "dusk" ];
              keepEnv = true;
            }
          ];
        };
      };

      system.stateVersion = "25.11";
    };
}
