{ pkgs, ... }:
{
  vim = {
    languages = {
      typescript = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
        extraDiagnostics.enable = true;
      };
    };
    formatter.conform-nvim.setupOpts = {
      formatters_by_ft = {
        javascript = [ "prettier" ];
        typescript = [ "prettier" ];
      };
    };
    extraPackages = [ pkgs.prettier ];
  };
}
