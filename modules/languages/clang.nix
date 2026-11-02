{ pkgs, ... }:
{
  vim = {
    languages = {
      clang = {
        enable = true;
        cHeader = true;
        lsp.enable = true;
        treesitter.enable = true;
      };
    };
    formatter.conform-nvim.setupOpts = {
      formatters_by_ft = {
        c = [ "clang-format" ];
        cpp = [ "clang-format" ];
      };
    };
    extraPackages = [ pkgs.clang-tools ];
  };
}
