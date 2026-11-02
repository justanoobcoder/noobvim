# General keymaps. Keymaps that belong to a plugin live next to that plugin's config.
{
  vim.keymaps = [
    {
      key = "<leader><leader>";
      mode = "n";
      action = "za";
      desc = "Toggle fold";
    }
    # Yank/paste go through the system clipboard, unless a register is given explicitly ("ay, "ap)
    {
      key = "y";
      mode = [
        "n"
        "v"
      ];
      expr = true;
      lua = true;
      action = "function() return vim.v.register == '\"' and '\"+y' or 'y' end";
      desc = "Yank to clipboard";
    }
    {
      key = "p";
      mode = [
        "n"
        "v"
      ];
      expr = true;
      lua = true;
      action = "function() return vim.v.register == '\"' and '\"+p' or 'p' end";
      desc = "Paste from clipboard";
    }
    {
      key = "<leader>p";
      mode = [
        "n"
        "v"
      ];
      action = "\"\"p";
      desc = "Paste from unnamed register";
    }
    {
      key = "<leader>P";
      mode = [
        "n"
        "v"
      ];
      action = "\"\"P";
      desc = "Paste from unnamed register (before)";
    }
    {
      key = ">";
      mode = "v";
      action = ">gv";
      desc = "Indent and keep selection";
    }
    {
      key = "<";
      mode = "v";
      action = "<gv";
      desc = "Dedent and keep selection";
    }
    {
      key = "<C-h>";
      mode = "n";
      action = "<C-w>h";
      desc = "Focus left window";
    }
    {
      key = "<C-j>";
      mode = "n";
      action = "<C-w>j";
      desc = "Focus lower window";
    }
    {
      key = "<C-k>";
      mode = "n";
      action = "<C-w>k";
      desc = "Focus upper window";
    }
    {
      key = "<C-l>";
      mode = "n";
      action = "<C-w>l";
      desc = "Focus right window";
    }
    # Move lines: <C-j>/<C-k> are window navigation and <A-j>/<A-k> are taken by the desktop
    {
      key = "<leader>j";
      mode = "n";
      action = ":m .+1<CR>==";
      desc = "Move line down";
    }
    {
      key = "<leader>k";
      mode = "n";
      action = ":m .-2<CR>==";
      desc = "Move line up";
    }
    {
      key = "J";
      mode = "v";
      action = ":m '>+1<CR>gv=gv";
      desc = "Move selection down";
    }
    {
      key = "K";
      mode = "v";
      action = ":m '<-2<CR>gv=gv";
      desc = "Move selection up";
    }
  ];
}
