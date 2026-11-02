{ pkgs, ... }:
{
  vim = {
    extraPlugins.persisted-nvim = {
      package = pkgs.vimPlugins.persisted-nvim;
      setup = ''
        require("persisted").setup({
          autostart = true,
          should_save = function()
            local ft = vim.bo.filetype
            local bt = vim.bo.buftype

            if ft == "dashboard" then
              return false
            end

            if ft == "" and bt == "" then
              return false
            end

            return true
          end,
        })
      '';
    };

    telescope.extensions = [
      {
        name = "persisted";
        setup = {
          layout_config = {
            width = 0.55;
            height = 0.55;
          };
        };
      }
    ];

    keymaps = [
      {
        key = "<leader>fl";
        mode = "n";
        action = "<cmd>Telescope persisted<CR>";
        desc = "Find sessions";
      }
      {
        key = "ZZ";
        mode = "n";
        lua = true;
        action = "function() require('persisted').save(); vim.cmd('wa'); vim.cmd('qa') end";
        desc = "Save session and quit";
      }
      {
        key = "ZQ";
        mode = "n";
        lua = true;
        action = "function() require('persisted').save(); vim.cmd('qa!') end";
        desc = "Save session and quit without write";
      }
    ];
  };
}
