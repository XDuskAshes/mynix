{ config, pkgs, ... }:

{
    imports =
        [
            ./hardware-configuration.nix
            ./modules/fonts.nix
            ./modules/wm-de/plasma/plasma.nix
        ];

        # Bootloader.
    boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };

    boot.kernelPackages = pkgs.linuxPackages_zen;

    networking.hostName = "nixtester"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant. (unsure if i will need this later)
    networking.networkmanager.enable = true;
    time.timeZone = "America/New_York";

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

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

    services.xserver.enable = true;
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        settings = {
            General = {
                DisplayServer = "wayland";
            };
        };
    };
    
    # plasma again
    doPlasma.enable = true;

    # niri! eventual env of choice
    programs.niri.enable = true;
    # swaylock thing on the search said something about having to set this manually. dunno what it does though.
    security.pam.services.swaylock = {};

    # Enable sound with pipewire.
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
    programs.fish.enable = true;
    users.users.dusk = {
        isNormalUser = true;
        description = "Dusk";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
        shell = pkgs.fish;
    };

    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
        
    ];

    nixpkgs.config.allowUnfree = true; # mostly because hardware is annoying on occasion. better safe than sorry. ¯\_(ツ)_/¯
    environment.systemPackages = with pkgs; [
        neovim
        wget
        btrfs-progs
        gnupg
        pinentry-qt
        firefox
        fish
        alacritty
        zoxide
        flatpak
        stow
        vlc
        fzf
        git
        fastfetch

        # muh gaaamesss
        prismlauncher
        steam

        # niri, mostly
        swaylock
        swaybg
    ];

    programs.steam = {
        enable = true;
        protontricks.enable = true;
    };

    programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
        pinentryPackage = pkgs.pinentry-qt;
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
