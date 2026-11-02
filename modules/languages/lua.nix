{ pkgs, ... }:
{
  vim = {
    languages = {
      lua = {
        enable = true;
        lsp.enable = true;
        lsp.servers = [ "lua-language-server" ];
        treesitter.enable = true;
        extraDiagnostics.enable = true;
      };
    };
    formatter.conform-nvim.setupOpts = {
      formatters_by_ft = {
        lua = [ "stylua" ];
      };
    };
    extraPackages = [ pkgs.stylua ];
  };
}
