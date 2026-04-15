vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.java",
  callback = function()
    vim.fn.jobstart({"mvn", "compile"}, { detach = true })
  end,
})
