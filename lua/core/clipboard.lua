vim.g.clipboard = {
  name = "win32yank",
  copy = {
    ["+"] = "clip.exe",
    ["*"] = "clip.exe"
  },
  paste = {
    ["+"] = "powershell.exe -command Get-Clipboard",
    ["*"] = "powershell.exe -command Get-Clipboard"
  },
  cache_enabled = 1,
}

