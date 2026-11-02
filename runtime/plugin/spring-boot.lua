-- Compile Maven projects in the background after saving a Java file
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("Maven Compile", { clear = true }),
  pattern = "*.java",
  callback = function(args)
    local root = vim.fs.root(args.buf, "pom.xml")
    if not root or vim.fn.executable("mvn") == 0 then
      return
    end
    vim.system({ "mvn", "-q", "compile" }, { cwd = root }, function(out)
      if out.code ~= 0 then
        vim.schedule(function()
          vim.notify("mvn compile failed:\n" .. out.stdout .. out.stderr, vim.log.levels.ERROR)
        end)
      end
    end)
  end,
})
