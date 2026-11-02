vim.filetype.add({
  extension = {
    ab = "amber",
  },
  -- Extensionless files inside these directories. The lowest priority makes them
  -- only apply when nothing else (extension, shebang, built-in rules) matched
  pattern = {
    [".*/amber/.*"] = { "amber", { priority = -math.huge } },
    [".*/zsh/.*"] = { "zsh", { priority = -math.huge } },
  },
})
