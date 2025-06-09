-- lua/core/clipboard.lua
vim.g.clipboard = {
  name = "wsl-clipboard",
  copy = {
    ["+"] = "clip.exe",
    ["*"] = "clip.exe",
  },
  paste = {
    ["+"] = "powershell.exe -nologo -noprofile -command Get-Clipboard",
    ["*"] = "powershell.exe -nologo -noprofile -command Get-Clipboard",
  },
  cache_enabled = 0,
}

