{ pkgs, ... }:
{
  vim = {
    languages = {
      nix = {
        enable = true;
        lsp.enable = true;
        lsp.servers = [ "nixd" ];
        treesitter.enable = true;
        extraDiagnostics.enable = true;
      };
    };
    formatter.conform-nvim.setupOpts = {
      formatters_by_ft = {
        nix = [ "nixfmt" ];
      };
    };
    extraPackages = [ pkgs.nixfmt ];
  };
}
