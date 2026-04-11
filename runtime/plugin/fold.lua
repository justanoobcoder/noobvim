vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false

local save_fold = vim.api.nvim_create_augroup("Persistent Folds", { clear = true })

vim.api.nvim_create_autocmd("BufWinLeave", {
	group = save_fold,
	pattern = "*.*",
	command = "mkview",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	group = save_fold,
	pattern = "*.*",
	command = "silent! loadview",
})
