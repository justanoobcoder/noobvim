{ lib, ... }:
{
  # Comment out a language to disable it (LSP, treesitter and formatter together)
  imports = [
    ./bash.nix
    ./clang.nix
    ./nix.nix
    ./rust.nix
    # ./lua.nix
    # ./java.nix
    # ./dart.nix
    # ./go.nix
    # ./typescript.nix
    # ./css.nix
    # ./html.nix
    # ./toml.nix
  ];

  vim = {
    lsp = {
      enable = true;
      lspconfig.enable = true;
      inlayHints.enable = false;
      formatOnSave = false;
      mappings = {
        goToDeclaration = "gD";
        goToDefinition = "gd";
        goToType = "gt";
        hover = "gh";
        listReferences = "gr";
        listDocumentSymbols = "<leader>lS";
      };
    };

    diagnostics = {
      enable = true;
      config = {
        signs.text = lib.generators.mkLuaInline ''
          {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
          }
        '';
        virtual_text = true;
        update_in_insert = true;
      };
    };

    augroups = [ { name = "DiagnosticFloat"; } ];
    autocmds = [
      {
        event = [ "CursorHold" ];
        group = "DiagnosticFloat";
        desc = "Show diagnostics under the cursor";
        callback = lib.generators.mkLuaInline ''
          function()
            vim.diagnostic.open_float(nil, { focus = false })
          end
        '';
      }
    ];

    keymaps = [
      {
        key = "<leader>ca";
        mode = "n";
        lua = true;
        action = "vim.lsp.buf.code_action";
        desc = "Code action";
      }
      {
        key = "<leader>il";
        mode = "n";
        lua = true;
        action = "function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end";
        desc = "Toggle inlay hints";
      }
    ];
  };
}
