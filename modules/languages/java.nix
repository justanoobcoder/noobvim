{ pkgs, ... }:
{
  vim = {
    languages = {
      java = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };
    };
    formatter.conform-nvim.setupOpts = {
      formatters = {
        java_format = {
          command = "google-java-format";
          args = [
            "--aosp"
            "-"
          ];
        };
      };
      formatters_by_ft = {
        java = [ "java_format" ];
      };
    };
    extraPackages = [ pkgs.google-java-format ];
  };
}
