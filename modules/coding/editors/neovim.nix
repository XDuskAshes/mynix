{ ... }:
{
  flake.nixosModule.neovim =
    { ... }:
    {
      programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
      };
    };
}
