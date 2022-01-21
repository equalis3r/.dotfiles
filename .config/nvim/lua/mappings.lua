local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Map in case no LSP is supported for filetype
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope find_buffers<CR>", opts)

-- Map switch windows as arrow keys
map("n", "<left>", "<C-w>h", opts)
map("n", "<down>", "<C-w>j", opts)
map("n", "<up>", "<C-w>k", opts)
map("n", "<right>", "<C-w>l", opts)

-- Whichkey-keymap
local wk = require("which-key")
wk.setup({
	show_help = false,
	triggers = "auto",
	plugins = {
		marks = false,
		registers = false,
		presets = { text_objects = false },
	},
	key_labels = { ["<leader>"] = "SPC" },
})
local M = {}
function M.setup(bufnr)
	local keymap = {
		["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
		["C-k"] = { "<cmd>lua vim.lsp.signature_help()<CR>", "Signature help" },

		["<leader>"] = {
			name = "+General",
			["<space>"] = {
				"<cmd>lua require'telescope'.extensions.file_browser.file_browser()<CR>",
				"Browse files",
			},
			i = { "<cmd>LspInfo<cr>", "LSP info" },
			t = { "<cmd>TodoQuickFix<CR>", "Todo" },
			a = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document diagnostics" },
			w = { "<cmd>Telescope diagnostics<cr>", "Workspace diagnostics" },
			c = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
			r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename variables" },
		},

		["<leader>f"] = {
			name = "+Find",
			b = { "<cmd>Telescope buffers<CR>", "Find buffers" },
			f = { "<cmd>Telescope find_files<CR>", "Find files" },
			c = { "<cmd>Telescope commands<CR>", "Find commands" },
			u = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Fuzzy search curent buffer" },
			d = { "<cmd>Telescope lsp_document_symbols()<CR>", "Find document symbols" },
			g = { "<cmd>Telescope live_grep<CR>", "Live grep" },
		},

		["<F5>"] = { "<cmd>lua require'dap'.continue()<CR>", "Start debugging" },
		["<F9>"] = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle breakpoint" },
		["<F10>"] = { "<cmd>lua require'dap'.step_over()<CR>", "Step over" },
		["<F11>"] = { "<cmd>lua require'dap'.step_into()<CR>", "Step into" },
		["<F12>"] = { "<cmd>lua require'dap'.step_out()<CR>", "Step out" },
		["<leader>d"] = {
			name = "+Debug",
			--m = {'<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',"Set breakpoint message",},
			b = { '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', "List breakpoints" },
			B = {
				'<cmd>lua require"dap".set_breakpoint(("Breakpoint condition: "))<CR>',
				"Set breakpoint condition",
			},
			o = { '<cmd>lua require"dap".repl.open()<CR>', "Open REPL" },
			--l = { '<cmd>lua require"dap".repl.run_last()<CR>', "Run last REPL" },
			u = { '<cmd>lua require"dapui".toggle()<CR>', "Toggle debug UI" },
			c = { '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', "Find commands" },
			v = { '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', "Find variables" },
			--f = { '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', "Frames" },
		},
	}

	local keymap_visual = {
		["<leader>"] = {
			name = "+General",
			c = { "<cmd>lua vim.lsp.buf.range_code_action()<CR>", "Code action" },
		},
	}

	local keymap_goto = {
		g = {
			name = "+Go to",
			-- r = { "<cmd>Telescope lsp_references<CR>", "References" },
			d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
			v = { "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", "Go to definition vsplit" },
			i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation" },
			-- t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Go to type definition" },
			--I = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Goto Declaration" },
			["["] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Go to prev diagnostic" },
			["]"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Go to next diagnostic" },
		},
	}

	wk.register(keymap, { buffer = bufnr, mode = "n", opts })
	wk.register(keymap_visual, { buffer = bufnr, mode = "v", opts })
	wk.register(keymap_goto, { buffer = bufnr, mode = "n", opts })
end
return M
