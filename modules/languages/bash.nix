{ pkgs, ... }:
{
  vim = {
    languages = {
      bash = {
        enable = true;
        lsp.enable = true;
        lsp.servers = [ "bash-language-server" ];
        treesitter.enable = true;
        extraDiagnostics.enable = true;
      };
    };
    formatter.conform-nvim.setupOpts = {
      formatters_by_ft = {
        bash = [ "shfmt" ];
        sh = [ "shfmt" ];
      };
    };
    extraPackages = [ pkgs.shfmt ];
  };
}
