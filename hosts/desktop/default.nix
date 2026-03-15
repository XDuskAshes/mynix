{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ./per-host
        ../../modules/nixos
    ]

    zramSwap = {
        enable = true;
        algorithm = "zstd";
        memoryPercent = 50;
    };

    boot.kernelPackages = pkgs.linuxPackages_zen;

    networking.hostName = "nixie"; # Define your hostname.
    networking.networkmanager.enable = true;
    time.timeZone = "America/New_York";

    nix = {
        settings = {
            experimental-features = [
                "nix-command"
                "flakes"
            ];
            auto-optimise-store = true;
        };
    };

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
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

    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    services.flatpak.enable = true;
    xdg.portal.enable = true;
    programs.git.enable = true;
    programs.fish.enable = true;
    
    users.users.dusk = {
        isNormalUser = true;
        description = "Dusk";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
        shell = pkgs.fish;
    };

    fileSystems."/mnt/SteamGames" = {
        device = "/dev/disk/by-label/SteamGames";
        fsType = "ext4";
        options = [ "defaults" ];
    };

    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [libxcrypt];

    nixpkgs.config.allowUnfree = true; # mostly because hardware is annoying on occasion. better safe than sorry. ¯\_(ツ)_/¯
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
        thunar
        nixd
        vscodium # useful to have sometimes
    ];

    programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
        pinentryPackage = pkgs.pinentry-qt;
    };

    security = {
        sudo = {
            enable = false;
        };

        doas = {
            enable = true;
            extraRules = [{
                users = ["dusk"];
                keepEnv = true;
            }];
        };
    };

    # I AM NOT GONNA TOUCH THIS MORE OR LESS OUT OF FEAR
    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.11"; # Did you read the comment?
}
