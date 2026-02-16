{ config, pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        
        viAlias = true;
        vimAlias = true;
        
        extraLuaConfig = ''
            ${builtins.readFile ./extern-config/neovim.lua}
        '';

        plugins = with pkgs.vimPlugins; [
            telescope-nvim
            vimwiki
            lualine-nvim
            fidget-nvim
        ];
    };
}
