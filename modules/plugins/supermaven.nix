{
  vim = {
    assistant.supermaven-nvim = {
      enable = true;
      setupOpts = {
        keymaps = {
          accept_suggestion = "<C-y>";
          accept_word = "<C-u>";
        };
      };
    };
    keymaps = [
      {
        key = "<leader>sv";
        mode = "n";
        action = "<cmd>SupermavenToggle<CR>";
        desc = "Toggle Supermaven";
      }
    ];
  };
}
