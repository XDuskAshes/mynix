{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    initLua = builtins.readFile ./extern-config/neovim.lua; # I had this wrong for WAY too long

    plugins = with pkgs.vimPlugins; [
      plenary-nvim
      telescope-nvim
      vimwiki
      lualine-nvim
      fidget-nvim
    ];
  };
}
