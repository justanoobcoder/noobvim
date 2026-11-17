{ pkgs, lib, ... }:
let
  clice = pkgs.callPackage ../../pkgs/clice.nix { };
in
{
  vim = {
    languages = {
      clang = {
        enable = true;
        cHeader = true;
        # clice serves C and C++ instead of nvf's clangd or ccls.
        lsp.enable = false;
        treesitter.enable = true;
      };
    };
    lsp.servers.clice = {
      enable = true;
      cmd = [
        (lib.getExe clice)
        "serve"
      ];
    };
    additionalRuntimePaths = [ clice.nvim ];
    formatter.conform-nvim.setupOpts = {
      formatters_by_ft = {
        c = [ "clang-format" ];
        cpp = [ "clang-format" ];
      };
    };
    extraPackages = [ pkgs.clang-tools ];
  };
}
