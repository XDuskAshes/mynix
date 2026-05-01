{ ... }:

{
  flake.homeModules = {
    firefox = import ./_firefox.nix;
    neovim = import ./_neovim.nix;
    zed = import ./_zed.nix;
    keepassxc = import ./_keepassxc.nix;
  };
}
