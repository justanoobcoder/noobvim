-- Re-apply after every colorscheme change, which clears custom highlights
local function set_hl()
	vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", {
		link = "SpecialChar",
	})
end

set_hl()
vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("Indentscope Highlight", { clear = true }),
	callback = set_hl,
})
