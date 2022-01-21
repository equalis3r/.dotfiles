require("packer").startup(function(use)
	-- Packer manager
	use("wbthomason/packer.nvim")
	use("tpope/vim-fugitive")
	-- LSP config, autocompletion, and formatting
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("simrat39/rust-tools.nvim")
	use("mfussenegger/nvim-jdtls")
	use("scalameta/nvim-metals")
	use("jose-elias-alvarez/null-ls.nvim")
	-- DAP
	use("mfussenegger/nvim-dap")
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("dapui").setup()
		end,
	})
	use({
		"mfussenegger/nvim-dap-python",
		config = function()
			require("dap-python").setup("/usr/bin/python")
			require("dap-python").test_runner = "pytest"
		end,
	})
	-- Utility
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-dap.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					borderchars = {
						{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
						prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
						results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
						preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})
			require("telescope").load_extension("dap")
			require("telescope").load_extension("fzf")
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		require = { "nvim-treesitter/nvim-treesitter-textobjects" },
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({
		"ThePrimeagen/refactoring.nvim",
		config = function()
			require("refactoring").setup({})
		end,
	})
	-- UI
	use({
		"EdenEast/nightfox.nvim",
		config = function()
			local nightfox = require("nightfox")
			nightfox.setup({
				fox = "duskfox",
			})
			nightfox.load()
		end,
	})
	use("folke/which-key.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({
				options = {
					theme = "nightfox",
					section_separators = "",
					component_separators = "|",
				},
				sections = {
					lualine_a = { { "mode", color = { gui = "bold" } } },
					lualine_b = {
						"branch",
						"diff",
						{
							"diagnostics",
							sources = { "nvim_diagnostic" },
							symbols = { error = " ", warn = " ", hint = " ", info = " " },
						},
					},
				},
			})
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { hl = "GitSignsAdd", text = "+" },
					change = { hl = "GitSignsChange", text = "~" },
					delete = { hl = "GitSignsDelete", text = "_" },
					topdelete = { hl = "GitSignsDelete", text = "‾" },
					changedelete = { hl = "GitSignsChange", text = "~" },
				},
			})
		end,
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				show_current_context = true,
			})
		end,
	})
	use({
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})
	-- Lua
	use({
		"goolord/alpha-nvim",
		config = function()
			local dashboard = require("alpha.themes.dashboard")
			local function button(sc, txt, keybind, keybind_opts)
				local b = dashboard.button(sc, txt, keybind, keybind_opts)
				b.opts.hl = "Identifier"
				b.opts.hl_shortcut = "Identifier"
				return b
			end
			dashboard.section.buttons.val = {
				button("r", "  > Recent files", ":Telescope oldfiles<CR>"),
				button("n", "  > New file", ":ene <BAR> startinsert <CR>"),
				button("f", "  > Find files", ":Telescope find_files hidden=true<CR>"),
				button("u", "  > Update plugins", ":PackerSync<CR>"),
				button("q", "  > Quit Neovim", ":qa<CR>"),
			}
			dashboard.section.footer.val = require("alpha.fortune")
			dashboard.section.header.val = {
				[[=================     ===============     ===============   ========  ========]],
				[[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
				[[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
				[[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
				[[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
				[[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
				[[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
				[[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
				[[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
				[[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
				[[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
				[[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
				[[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
				[[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
				[[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
				[[||.=='    _-'                                                     `' |  /==.||]],
				[[=='    _-'                     E Q U A L I S 3 R                      \/   `==]],
				[[\   _-'                                                                `-_   /]],
				[[ `''                                                                      ``' ]],
			}
			dashboard.section.header.opts.hl = "Function"
			dashboard.section.footer.opts.hl = "Function"
			require("alpha").setup(require("alpha.themes.dashboard").opts)
		end,
	})
end)
