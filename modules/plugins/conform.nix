# Formatters for each language are declared in modules/languages/<lang>.nix
{
  vim = {
    formatter.conform-nvim.enable = true;
    keymaps = [
      {
        key = "<leader>cf";
        mode = [
          "n"
          "x"
        ];
        action = ":Format<CR>";
        desc = "Format buffer/selection";
      }
    ];
  };
}
