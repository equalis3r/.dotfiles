require("plugins")
require("lsp")
require("treesitter")
require("mappings")
require("completion")

--vim.o.hlsearch = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.mouse = "a" --Enable mouse mode
vim.o.breakindent = true
vim.opt.undofile = true --Save undo history

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

--Set tab
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

--Set colorscheme (order is important here)
vim.o.termguicolors = true

--Treesitter folding method
vim.cmd("setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()")
vim.o.foldlevel = 99

-- Hightlight on yank
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {}")

--Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_char_highlight = "LineNr"
vim.g.indent_blankline_show_trailing_blankline_indent = false

--DiagnosticSign
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
