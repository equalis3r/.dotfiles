--Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("keymaps")
require("lazy").setup("plugins")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true --Case insensitive searching UNLESS /C
vim.opt.smartcase = true
vim.opt.updatetime = 200
vim.opt.signcolumn = "yes"
vim.opt.showmode = false -- Dont show mode since we have a statusline
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.termguicolors = true

--Treesitter folding method
vim.cmd("setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()")
vim.o.foldlevel = 99

-- Highlight on yank
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {}")
