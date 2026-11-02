-- Normal mode types commands, not text: switch fcitx5 off outside insert mode
-- and back on when entering it, but only if it was on before
if vim.fn.executable("fcitx5-remote") == 0 then
	return
end

local fcitx = vim.api.nvim_create_augroup("Fcitx Auto Switch", { clear = true })
local restore = false

local function off()
	-- fcitx5-remote prints 2 when the input method is active, 1 when not
	restore = vim.trim(vim.fn.system({ "fcitx5-remote" })) == "2"
	if restore then
		vim.fn.system({ "fcitx5-remote", "-c" })
	end
end

local function on()
	if restore then
		restore = false
		vim.fn.system({ "fcitx5-remote", "-o" })
	end
end

vim.api.nvim_create_autocmd("InsertLeave", {
	group = fcitx,
	callback = off,
})

-- Opening a file starts in normal mode (unless +startinsert); coming back from the shell too
vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
	group = fcitx,
	callback = function()
		if not vim.fn.mode():match("^[iR]") then
			off()
		end
	end,
})

-- Give the shell its input method back when quitting or suspending
vim.api.nvim_create_autocmd({ "InsertEnter", "VimLeavePre", "VimSuspend" }, {
	group = fcitx,
	callback = on,
})
