{ config, pkgs, spicetify-nix, ... }:

{
    home = {
        username = "dusk";
        homeDirectory = "/home/dusk";
        stateVersion = "25.11";
    };

    programs.firefox = {
        enable = true;
        policies = {
            AppAutoUpdate = false;
            BackgroundAppUpdate = false;

            # I don't want any of this shit
            DisableFirefoxStudies = true;
            DisableMasterPasswordCreation = true;
            DisableSetDesktopBackground = true;
            DisableTelemetry = true;
            DisablePocket = true;
            DisableFirefoxScreenshots = true;
            DisableFirefoxAccounts = true;
            DontCheckDefaultBrowser = true;
            GenerativeAI = { # AI should not be in my browser to begin with!
                Enabled = false;
                Chatbot = false;
                LinkPreviews = false;
                TabGroups = false;
                Locked = true;
            };

            # I want this shit
            HardwareAcceleration = true;
            DefaultDownloadDirectory = "/home/dusk/Downloads";

            # Extensions!
            ExtensionSettings = let
                moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
            in {
                "uBlock0@raymondhill.net" = {
                    install_url = moz "ublock-origin";
                    installation_mode = "force_installed";
                    default_area = "navbar";
                };
                "jid1-MnnxcxisBPnSXQ@jetpack" = {
                    install_url = moz "privacy-badger17";
                    installation_mode = "force_installed";
                    default_area = "navbar";
                };
                "@contain-facebook" = {
                    install_url = moz "facebook-container";
                    installation_mode = "force_installed";
                };
                "sponsorBlocker@ajay.app" = {
                    install_url = moz "sponsorblock";
                    installation_mode = "force_installed";
                };
                "{34daeb50-c2d2-4f14-886a-7160b24d66a4}" = {
                    install_url = moz "youtube-shorts-block";
                    installation_mode = "force_installed";
                };
            };
        };
        
        profiles.default.search = {
            force = true;
            default = "ddg";
            privateDefault = "ddg";
        };
    };

    #programs.vesktop = { # You, reading this. You aren't some narc, are ya?
    #    enable = true;
    #};

    services.mako = {
        enable = true;
    };

    home.pointerCursor = {
        enable = true;
        package = pkgs.nordzy-cursor-theme;
        name = "Nordzy";
        size = 24;
        gtk.enable = true;
        x11.enable = true;
    };

    programs.rofi = {
        enable = true;
        plugins = with pkgs; [
            rofi-calc
        ];
        extraConfig = {
            
        };
    };

    programs.neovim = {
        enable = true;
    };
}
