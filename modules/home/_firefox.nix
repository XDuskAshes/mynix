{ ... }:

{
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
      GenerativeAI = {
        # AI should not be in my browser to begin with!
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
      ExtensionSettings =
        let
          moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
        in
        {
          # Not perfect, but it's something.
          "uBlock0@raymondhill.net" = {
            # uBlock Origin - https://ublockorigin.com/
            install_url = moz "ublock-origin";
            installation_mode = "force_installed";
            default_area = "navbar";
          };
          "jid1-MnnxcxisBPnSXQ@jetpack" = {
            # Privacy Badger - https://privacybadger.org/
            install_url = moz "privacy-badger17";
            installation_mode = "force_installed";
            default_area = "navbar";
          };

          # i feel like a lot of misinformation among the elderly could be solved by deleting facebook
          # probably anyway
          "@contain-facebook" = {
            # Facebook Container - https://github.com/mozilla/contain-facebook
            install_url = moz "facebook-container";
            installation_mode = "force_installed";
          };

          # I have decided I do not trust a browser with my passwords.
          # It can have my bookmarks though, mostly for a lack of other
          # ways I would enjoy having those set declaratively. Plus it's
          # nice to freely bookmark.

          "keepassxc-browser@keepassxc.org" = {
            install_url = moz "keepassxc-browser";
            installation_mode = "force_installed";
          };

          # YouTube by itself is a clusterfuck that basically requires
          # you to yank your wallet out and pay for convenience. While
          # I agree paying for convenience is sometimes okay, like
          # paying some other dude to fix your plumbing, I don't think
          # you should have to pay for what feels like a usable experience.
          #
          # As unfortunate as this is, YouTube as it is remains too big to fail.
          # That being that it can't fail, or else it takes basically most of
          # modern human knowledge down with it into the smoldering pit it would
          # become. So we have to work around the greedy bullshit.
          "sponsorBlocker@ajay.app" = {
            # SponsorBlock - https://sponsor.ajay.app/
            install_url = moz "sponsorblock";
            installation_mode = "force_installed";
          };
          "{34daeb50-c2d2-4f14-886a-7160b24d66a4}" = {
            # Youtube-shorts Block - https://github.com/doma-itachi/Youtube-shorts-block
            install_url = moz "youtube-shorts-block";
            installation_mode = "force_installed";
          };
          "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
            # Return Youtube Dislike - https://returnyoutubedislike.com/
            install_url = moz "return-youtube-dislikes";
            installation_mode = "force_installed";
          };
        };
    };

    profiles.default = {
      search = {
        default = "ddg";
        force = true;
      };
    };
  };
}
