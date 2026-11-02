{
  vim = {
    telescope.enable = true;
    keymaps = [
      {
        key = "<leader>ff";
        mode = "n";
        action = "<cmd>Telescope find_files<CR>";
        desc = "Find files";
      }
      {
        key = "<leader>fg";
        mode = [
          "n"
          "x"
        ];
        action = "<cmd>Telescope live_grep<CR>";
        desc = "Find text";
      }
      {
        key = "<leader>fb";
        mode = "n";
        action = "<cmd>Telescope buffers<CR>";
        desc = "Find buffers";
      }
      {
        key = "<leader>fcb";
        mode = "n";
        action = "<cmd>Telescope current_buffer_fuzzy_find<CR>";
        desc = "Find in current buffer";
      }
      {
        key = "<leader>fd";
        mode = "n";
        action = "<cmd>Telescope diagnostics<CR>";
        desc = "Find diagnostics";
      }
    ];
  };
}
