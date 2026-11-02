{ pkgs, ... }:
{
  vim = {
    languages = {
      toml = {
        enable = true;
        lsp.enable = true;
        extraDiagnostics.enable = true;
        treesitter.enable = true;
      };
    };
    formatter.conform-nvim.setupOpts = {
      formatters = {
        toml_format = {
          command = "taplo";
          args = [
            "fmt"
            "-"
          ];
        };
      };
      formatters_by_ft = {
        toml = [ "toml_format" ];
      };
    };
    extraPackages = [ pkgs.taplo ];
  };
}
