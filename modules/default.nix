{
  lib,
  pkgs,
  ...
}: {
  config.vim = lib.mkMerge [
    (import ./config.nix)
    (import ./options.nix)
    (import ./keymaps.nix)
    (import ./theme.nix)
    (import ./plugins)
    (import ./plugins/conform.nix {inherit pkgs;})
    (import ./plugins/persist.nix {inherit pkgs;})
    (import ./plugins/neo-tree.nix)
    (import ./plugins/nvim-cmp.nix)
    (import ./plugins/comment-nvim.nix)
    (import ./plugins/colorizer.nix)
    (import ./plugins/indent-blankline.nix)
    (import ./plugins/toggleterm.nix)
    (import ./plugins/lsp {inherit lib;})
  ];
}
