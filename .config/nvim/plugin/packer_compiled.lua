-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/equalis3r/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/equalis3r/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/equalis3r/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/equalis3r/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/equalis3r/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { "\27LJ\1\2H\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\tload luasnip.loaders.from_vscode\frequire\0" },
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\1\2g\0\4\t\1\5\0\14+\4\0\0007\4\0\4\16\5\0\0\16\6\1\0\16\a\2\0\16\b\3\0>\4\5\0027\5\1\4%\6\3\0:\6\2\0057\5\1\4%\6\3\0:\6\4\5H\4\2\0\0¿\16hl_shortcut\15Identifier\ahl\topts\vbutton \16\1\0\b\0\30\1E4\0\0\0%\1\1\0>\0\2\0021\1\2\0007\2\3\0007\2\4\0022\3\6\0\16\4\1\0%\5\6\0%\6\a\0%\a\b\0>\4\4\2;\4\1\3\16\4\1\0%\5\t\0%\6\n\0%\a\v\0>\4\4\2;\4\2\3\16\4\1\0%\5\f\0%\6\r\0%\a\14\0>\4\4\2;\4\3\3\16\4\1\0%\5\15\0%\6\16\0%\a\17\0>\4\4\2;\4\4\3\16\4\1\0%\5\18\0%\6\19\0%\a\20\0>\4\4\0<\4\0\0:\3\5\0027\2\3\0007\2\21\0024\3\0\0%\4\22\0>\3\2\2:\3\5\0027\2\3\0007\2\23\0023\3\24\0:\3\5\0027\2\3\0007\2\23\0027\2\25\2%\3\27\0:\3\26\0027\2\3\0007\2\21\0027\2\25\2%\3\27\0:\3\26\0024\2\0\0%\3\28\0>\2\2\0027\2\29\0024\3\0\0%\4\1\0>\3\2\0027\3\25\3>\2\2\0010\0\0ÄG\0\1\0\nsetup\nalpha\rFunction\ahl\topts\1\20\0\0S=================     ===============     ===============   ========  ========S\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //S||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||S|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||S||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||S|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||S||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||S|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||S||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||S||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||S||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||S||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||S||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||S||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||S||   .=='    _-'          '-__\\._-'         '-_./__-'         `' |. /|  |   ||S||.=='    _-'                                                     `' |  /==.||S=='    _-'                     E Q U A L I S 3 R                      \\/   `==S\\   _-'                                                                `-_   /S `''                                                                      ``' \vheader\18alpha.fortune\vfooter\f:qa<CR>\23ÔúÖ  > Quit Neovim\6q\20:PackerSync<CR>\26Ôë™  > Update plugins\6u*:Telescope find_files hidden=true<CR>\22Ôúù  > Find files\6f :ene <BAR> startinsert <CR>\20ÔÖõ  > New file\6n\28:Telescope oldfiles<CR>\24Ôú°  > Recent files\6r\bval\fbuttons\fsection\0\27alpha.themes.dashboard\frequire\vÄÄ¿ô\4\0" },
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2™\2\0\0\4\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\1>\0\2\1G\0\1\0\nsigns\1\0\0\17changedelete\1\0\2\ttext\6~\ahl\19GitSignsChange\14topdelete\1\0\2\ttext\b‚Äæ\ahl\19GitSignsDelete\vdelete\1\0\2\ttext\6_\ahl\19GitSignsDelete\vchange\1\0\2\ttext\6~\ahl\19GitSignsChange\badd\1\0\0\1\0\2\ttext\6+\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\1\2[\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\25show_current_context\2\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2Ù\2\0\0\6\0\19\0\0254\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\t\0002\3\3\0003\4\6\0003\5\a\0:\5\b\4;\4\1\3:\3\n\0023\3\v\0003\4\f\0003\5\r\0:\5\14\0043\5\15\0:\5\16\4;\4\3\3:\3\17\2:\2\18\1>\0\2\1G\0\1\0\rsections\14lualine_b\fsymbols\1\0\4\tinfo\tÔÅö \thint\tÔÅ™ \twarn\tÔÅ± \nerror\tÔÅó \fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\ncolor\1\0\1\bgui\tbold\1\2\0\0\tmode\foptions\1\0\0\1\0\3\25component_separators\6|\23section_separators\5\ntheme\rnightfox\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  neogen = {
    config = { "\27LJ\1\2û\1\0\0\5\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\a\0003\3\5\0003\4\4\0:\4\6\3:\3\b\2:\2\t\1>\0\2\1G\0\1\0\14languages\vpython\1\0\0\rtemplate\1\0\0\1\0\1\26annotation_convention\rnumpydoc\1\0\1\fenabled\2\nsetup\vneogen\frequire\0" },
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/neogen",
    url = "https://github.com/danymat/neogen"
  },
  ["nightfox.nvim"] = {
    config = { "\27LJ\1\2V\0\0\3\0\5\0\t4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\3\0>\1\2\0017\1\4\0>\1\1\1G\0\1\0\tload\1\0\1\bfox\fduskfox\nsetup\rnightfox\frequire\0" },
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2@\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-python"] = {
    config = { "\27LJ\1\2s\0\0\2\0\6\0\f4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\0014\0\0\0%\1\1\0>\0\2\2%\1\5\0:\1\4\0G\0\1\0\vpytest\16test_runner\20/usr/bin/python\nsetup\15dap-python\frequire\0" },
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\1\0023\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\ndapui\frequire\0" },
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/nvim-jdtls",
    url = "https://github.com/mfussenegger/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-metals"] = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/nvim-metals",
    url = "https://github.com/scalameta/nvim-metals"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["refactoring.nvim"] = {
    config = { "\27LJ\1\2=\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\16refactoring\frequire\0" },
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\1\2î\5\0\0\5\0\27\0)4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\19\0003\2\v\0003\3\5\0003\4\3\0;\4\1\0033\4\4\0:\4\6\0033\4\a\0:\4\b\0033\4\t\0:\4\n\3:\3\f\0023\3\14\0003\4\r\0:\4\15\0033\4\16\0:\4\17\3:\3\18\2:\2\20\0013\2\22\0003\3\21\0:\3\23\2:\2\24\1>\0\2\0014\0\0\0%\1\1\0>\0\2\0027\0\25\0%\1\26\0>\0\2\0014\0\0\0%\1\1\0>\0\2\0027\0\25\0%\1\23\0>\0\2\1G\0\1\0\bdap\19load_extension\15extensions\bfzf\1\0\0\1\0\4\28override_generic_sorter\2\14case_mode\15smart_case\25override_file_sorter\2\nfuzzy\2\rdefaults\1\0\0\18layout_config\rvertical\1\0\1\vmirror\1\15horizontal\1\0\3\vheight\4ö≥ÊÃ\tô≥¶ˇ\3\19preview_cutoff\3x\nwidth\4◊«¬Î\3äÆØˇ\3\1\0\2\18results_width\4ö≥ÊÃ\tô≥¶ˇ\3\18preview_width\4ö≥ÊÃ\tô≥Üˇ\3\16borderchars\1\0\0\fpreview\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚îå\b‚îê\b‚îò\b‚îî\fresults\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚îå\b‚îê\b‚îò\b‚îî\vprompt\1\0\0\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚îå\b‚îê\b‚îò\b‚îî\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚îå\b‚îê\b‚îò\b‚îî\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\1\2?\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/equalis3r/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-dap-python
time([[Config for nvim-dap-python]], true)
try_loadstring("\27LJ\1\2s\0\0\2\0\6\0\f4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\0014\0\0\0%\1\1\0>\0\2\2%\1\5\0:\1\4\0G\0\1\0\vpytest\16test_runner\20/usr/bin/python\nsetup\15dap-python\frequire\0", "config", "nvim-dap-python")
time([[Config for nvim-dap-python]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\1\2H\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\tload luasnip.loaders.from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\1\2[\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\25show_current_context\2\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\1\0023\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\1\2g\0\4\t\1\5\0\14+\4\0\0007\4\0\4\16\5\0\0\16\6\1\0\16\a\2\0\16\b\3\0>\4\5\0027\5\1\4%\6\3\0:\6\2\0057\5\1\4%\6\3\0:\6\4\5H\4\2\0\0¿\16hl_shortcut\15Identifier\ahl\topts\vbutton \16\1\0\b\0\30\1E4\0\0\0%\1\1\0>\0\2\0021\1\2\0007\2\3\0007\2\4\0022\3\6\0\16\4\1\0%\5\6\0%\6\a\0%\a\b\0>\4\4\2;\4\1\3\16\4\1\0%\5\t\0%\6\n\0%\a\v\0>\4\4\2;\4\2\3\16\4\1\0%\5\f\0%\6\r\0%\a\14\0>\4\4\2;\4\3\3\16\4\1\0%\5\15\0%\6\16\0%\a\17\0>\4\4\2;\4\4\3\16\4\1\0%\5\18\0%\6\19\0%\a\20\0>\4\4\0<\4\0\0:\3\5\0027\2\3\0007\2\21\0024\3\0\0%\4\22\0>\3\2\2:\3\5\0027\2\3\0007\2\23\0023\3\24\0:\3\5\0027\2\3\0007\2\23\0027\2\25\2%\3\27\0:\3\26\0027\2\3\0007\2\21\0027\2\25\2%\3\27\0:\3\26\0024\2\0\0%\3\28\0>\2\2\0027\2\29\0024\3\0\0%\4\1\0>\3\2\0027\3\25\3>\2\2\0010\0\0ÄG\0\1\0\nsetup\nalpha\rFunction\ahl\topts\1\20\0\0S=================     ===============     ===============   ========  ========S\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //S||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||S|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||S||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||S|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||S||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||S|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||S||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||S||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||S||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||S||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||S||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||S||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||S||   .=='    _-'          '-__\\._-'         '-_./__-'         `' |. /|  |   ||S||.=='    _-'                                                     `' |  /==.||S=='    _-'                     E Q U A L I S 3 R                      \\/   `==S\\   _-'                                                                `-_   /S `''                                                                      ``' \vheader\18alpha.fortune\vfooter\f:qa<CR>\23ÔúÖ  > Quit Neovim\6q\20:PackerSync<CR>\26Ôë™  > Update plugins\6u*:Telescope find_files hidden=true<CR>\22Ôúù  > Find files\6f :ene <BAR> startinsert <CR>\20ÔÖõ  > New file\6n\28:Telescope oldfiles<CR>\24Ôú°  > Recent files\6r\bval\fbuttons\fsection\0\27alpha.themes.dashboard\frequire\vÄÄ¿ô\4\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: neogen
time([[Config for neogen]], true)
try_loadstring("\27LJ\1\2û\1\0\0\5\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\a\0003\3\5\0003\4\4\0:\4\6\3:\3\b\2:\2\t\1>\0\2\1G\0\1\0\14languages\vpython\1\0\0\rtemplate\1\0\0\1\0\1\26annotation_convention\rnumpydoc\1\0\1\fenabled\2\nsetup\vneogen\frequire\0", "config", "neogen")
time([[Config for neogen]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\2î\5\0\0\5\0\27\0)4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\19\0003\2\v\0003\3\5\0003\4\3\0;\4\1\0033\4\4\0:\4\6\0033\4\a\0:\4\b\0033\4\t\0:\4\n\3:\3\f\0023\3\14\0003\4\r\0:\4\15\0033\4\16\0:\4\17\3:\3\18\2:\2\20\0013\2\22\0003\3\21\0:\3\23\2:\2\24\1>\0\2\0014\0\0\0%\1\1\0>\0\2\0027\0\25\0%\1\26\0>\0\2\0014\0\0\0%\1\1\0>\0\2\0027\0\25\0%\1\23\0>\0\2\1G\0\1\0\bdap\19load_extension\15extensions\bfzf\1\0\0\1\0\4\28override_generic_sorter\2\14case_mode\15smart_case\25override_file_sorter\2\nfuzzy\2\rdefaults\1\0\0\18layout_config\rvertical\1\0\1\vmirror\1\15horizontal\1\0\3\vheight\4ö≥ÊÃ\tô≥¶ˇ\3\19preview_cutoff\3x\nwidth\4◊«¬Î\3äÆØˇ\3\1\0\2\18results_width\4ö≥ÊÃ\tô≥¶ˇ\3\18preview_width\4ö≥ÊÃ\tô≥Üˇ\3\16borderchars\1\0\0\fpreview\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚îå\b‚îê\b‚îò\b‚îî\fresults\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚îå\b‚îê\b‚îò\b‚îî\vprompt\1\0\0\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚îå\b‚îê\b‚îò\b‚îî\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚îå\b‚îê\b‚îò\b‚îî\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\2™\2\0\0\4\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\1>\0\2\1G\0\1\0\nsigns\1\0\0\17changedelete\1\0\2\ttext\6~\ahl\19GitSignsChange\14topdelete\1\0\2\ttext\b‚Äæ\ahl\19GitSignsDelete\vdelete\1\0\2\ttext\6_\ahl\19GitSignsDelete\vchange\1\0\2\ttext\6~\ahl\19GitSignsChange\badd\1\0\0\1\0\2\ttext\6+\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\1\2?\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\1\2@\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: refactoring.nvim
time([[Config for refactoring.nvim]], true)
try_loadstring("\27LJ\1\2=\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\16refactoring\frequire\0", "config", "refactoring.nvim")
time([[Config for refactoring.nvim]], false)
-- Config for: nightfox.nvim
time([[Config for nightfox.nvim]], true)
try_loadstring("\27LJ\1\2V\0\0\3\0\5\0\t4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\3\0>\1\2\0017\1\4\0>\1\1\1G\0\1\0\tload\1\0\1\bfox\fduskfox\nsetup\rnightfox\frequire\0", "config", "nightfox.nvim")
time([[Config for nightfox.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\2Ù\2\0\0\6\0\19\0\0254\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\t\0002\3\3\0003\4\6\0003\5\a\0:\5\b\4;\4\1\3:\3\n\0023\3\v\0003\4\f\0003\5\r\0:\5\14\0043\5\15\0:\5\16\4;\4\3\3:\3\17\2:\2\18\1>\0\2\1G\0\1\0\rsections\14lualine_b\fsymbols\1\0\4\tinfo\tÔÅö \thint\tÔÅ™ \twarn\tÔÅ± \nerror\tÔÅó \fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\ncolor\1\0\1\bgui\tbold\1\2\0\0\tmode\foptions\1\0\0\1\0\3\25component_separators\6|\23section_separators\5\ntheme\rnightfox\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
