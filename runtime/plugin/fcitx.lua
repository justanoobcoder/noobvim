-- Normal mode types commands, not text: switch fcitx5 off when leaving insert
-- mode and back on when entering it, but only if it was on before
if vim.fn.executable("fcitx5-remote") == 0 then
	return
end

local fcitx = vim.api.nvim_create_augroup("Fcitx Auto Switch", { clear = true })
local restore = false

vim.api.nvim_create_autocmd("InsertLeave", {
	group = fcitx,
	callback = function()
		-- fcitx5-remote prints 2 when the input method is active, 1 when not
		restore = vim.trim(vim.fn.system({ "fcitx5-remote" })) == "2"
		if restore then
			vim.fn.system({ "fcitx5-remote", "-c" })
		end
	end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
	group = fcitx,
	callback = function()
		if restore then
			vim.fn.jobstart({ "fcitx5-remote", "-o" }, { detach = true })
		end
	end,
})
