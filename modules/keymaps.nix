{
  keymaps = [
    {
      key = "<leader>ff";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope find_files<CR>";
    }
    {
      key = "<leader>fg";
      mode = ["n" "x"];
      silent = true;
      action = "<cmd>Telescope live_grep<CR>";
    }
    {
      key = "<leader>fb";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope buffers<CR>";
    }
    {
      key = "<leader>fcb";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope current_buffer_fuzzy_find<CR>";
    }
    {
      key = "<leader>fd";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope diagnostics<CR>";
    }
    {
      key = "<C-h>";
      mode = "n";
      silent = true;
      action = "<C-w>h";
    }
    {
      key = "<C-j>";
      mode = "n";
      silent = true;
      action = "<C-w>j";
    }
    {
      key = "<C-k>";
      mode = "n";
      silent = true;
      action = "<C-w>k";
    }
    {
      key = "<C-l>";
      mode = "n";
      silent = true;
      action = "<C-w>l";
    }
    {
      key = "<S-h>";
      mode = "n";
      silent = true;
      action = ":BufferLineCyclePrev<CR>";
    }
    {
      key = "<S-l>";
      mode = "n";
      silent = true;
      action = ":BufferLineCycleNext<CR>";
    }
    {
      key = "<leader>e";
      mode = "n";
      silent = true;
      action = ":Neotree toggle<CR>";
    }
    {
      key = "<leader>bd";
      mode = "n";
      silent = true;
      action = "function() vim.cmd('Neotree close'); vim.cmd('bd') end";
      lua = true;
    }
    {
      key = "<leader>cf";
      mode = "n";
      silent = true;
      action = ":Format<CR>";
    }
  ];
}
