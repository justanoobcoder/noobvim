{
  imports = [
    ./colorizer.nix
    ./comment-nvim.nix
    ./conform.nix
    ./dashboard
    ./flash.nix
    ./indent-blankline.nix
    ./luasnip.nix
    ./neo-tree.nix
    ./nvim-cmp.nix
    ./persist.nix
    ./supermaven.nix
    ./telescope.nix
    ./toggleterm.nix
    ./ufo.nix
  ];

  # Plugins that need little or no configuration
  vim = {
    undoFile.enable = true;
    git.gitsigns.enable = true;
    autopairs.nvim-autopairs.enable = true;
    binds.whichKey.enable = true;
    tabline.nvimBufferline = {
      enable = true;
      setupOpts.options.numbers = "none";
    };
    statusline.lualine.enable = true;
    treesitter = {
      enable = true;
      indent.enable = true;
      indent.excludes = [ "cpp" ];
    };
    ui = {
      illuminate.enable = true;
    };
    utility = {
      oil-nvim.enable = true;
      grug-far-nvim.enable = true;
      images.image-nvim = {
        enable = true;
        setupOpts.backend = "kitty";
      };
      multicursors.enable = true;
    };
    visuals.rainbow-delimiters.enable = true;

    keymaps = [
      {
        key = "<S-h>";
        mode = "n";
        action = "<cmd>BufferLineCyclePrev<CR>";
        desc = "Previous buffer";
      }
      {
        key = "<S-l>";
        mode = "n";
        action = "<cmd>BufferLineCycleNext<CR>";
        desc = "Next buffer";
      }
      {
        key = "-";
        mode = "n";
        action = "<cmd>Oil<CR>";
        desc = "Open parent directory (Oil)";
      }
      {
        key = "<leader>sr";
        mode = [
          "n"
          "x"
        ];
        action = "<cmd>GrugFar<CR>";
        desc = "Search and replace";
      }
      {
        key = "<leader>sf";
        mode = "n";
        lua = true;
        action = "function() require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>'), paths = vim.fn.expand('%') } }) end";
        desc = "Search word in current file";
      }
      {
        key = "<leader>sF";
        mode = "n";
        lua = true;
        action = "function() require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') } }) end";
        desc = "Search word in project";
      }
      {
        key = "<leader>sf";
        mode = "v";
        action = ":lua require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand('%') } })<CR>";
        desc = "Search selection in current file";
      }
      {
        key = "<leader>sF";
        mode = "v";
        action = ":lua require('grug-far').with_visual_selection()<CR>";
        desc = "Search selection in project";
      }
      {
        key = "<leader>mc";
        mode = "n";
        action = "<cmd>MCstart<CR>";
        desc = "Start multicursor";
      }
    ];
  };
}
