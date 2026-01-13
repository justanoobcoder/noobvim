{pkgs, ...}: {
  extraPlugins.persisted-nvim = {
    package = pkgs.vimPlugins.persisted-nvim;
  };
}
