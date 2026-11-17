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
      # TODO(neovim#42356): remove on Neovim 0.13. Before it, a range response arriving after a
      # delta request was sent replaces the tokens the delta applies to, and decoding the
      # result fails ("semantic_tokens.lua:133: attempt to perform arithmetic on a nil value").
      on_init = lib.generators.mkLuaInline ''
        function(client)
          local provider = client.server_capabilities.semanticTokensProvider
          if provider then
            provider.range = nil
          end
        end
      '';
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
