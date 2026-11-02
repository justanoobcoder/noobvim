{ pkgs, ... }:
{
  vim = {
    languages = {
      html = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
        treesitter.autotagHtml = true;
        extraDiagnostics.enable = true;
      };
    };
    formatter.conform-nvim.setupOpts = {
      formatters_by_ft = {
        html = [ "superhtml" ];
      };
    };
    extraPackages = [ pkgs.superhtml ];
  };
}
