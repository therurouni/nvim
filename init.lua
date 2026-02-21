-- 1. BOOTSTRAP LAZY.NVIM
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- 2. BASIC OPTIONS
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.mouse = "a"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true  -- Already handles case-sensitive searching
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.number = true      -- Line numbers
vim.opt.relativenumber = true -- Better for jumping lines

-- 3. LOAD PLUGINS
require("lazy").setup({ spec = { { import = "plugins" } } })

-- 4. LOAD KEYMAPS
require("config.keymaps")

