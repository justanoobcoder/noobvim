{
  vim.options = {
    mouse = "a";
    tabstop = 2;
    shiftwidth = 2;
    smartindent = true;
    scrolloff = 5;
    foldenable = false;
    foldcolumn = "1";
    foldlevel = 99;
    foldlevelstart = 99;
    # Only persist folds and cursor in views (see runtime/plugin/fold.lua),
    # otherwise stale local options get restored with the view
    viewoptions = "folds,cursor";
  };
}
