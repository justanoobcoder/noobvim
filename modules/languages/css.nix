{ pkgs, ... }:
{
  vim = {
    languages = {
      css = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };
    };
    formatter.conform-nvim.setupOpts = {
      formatters_by_ft = {
        css = [ "prettier" ];
      };
    };
    extraPackages = [ pkgs.prettier ];
  };
}
