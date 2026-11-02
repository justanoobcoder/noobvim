{ pkgs, ... }:
{
  vim = {
    languages = {
      rust = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
        extensions.crates-nvim = {
          enable = true;
          setupOpts.completion.crates.enabled = true;
        };
      };
    };
    formatter.conform-nvim.setupOpts = {
      formatters_by_ft = {
        rust = [ "rustfmt" ];
      };
    };
    extraPackages = [ pkgs.rustfmt ];
  };
}
