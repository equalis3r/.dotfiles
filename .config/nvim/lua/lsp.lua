local nvim_lsp = require("lspconfig")

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	float = {
		source = "always",
	},
})

local border = {
	{ "🭽", "FloatBorder" },
	{ "▔", "FloatBorder" },
	{ "🭾", "FloatBorder" },
	{ "▕", "FloatBorder" },
	{ "🭿", "FloatBorder" },
	{ "▁", "FloatBorder" },
	{ "🭼", "FloatBorder" },
	{ "▏", "FloatBorder" },
}

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
	["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = border, focusable = false }
	),
}

local on_attach = function(client, bufnr)
	require("mappings").setup(bufnr)
	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end
	vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil,{focusable=false,scope="line"})]])
	vim.cmd([[autocmd CursorHoldI * lua vim.lsp.buf.signature_help()]])
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local null_ls = require("null-ls")
null_ls.setup({
	on_attach = on_attach,
	handlers = handlers,
	capabilities = capabilities,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.diagnostics.flake8.with({
			extra_args = { "--ignore", "E203,E501,W503" },
		}),
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.code_actions.refactoring,
	},
})

-- Enable the following language servers
local servers = { "clangd", "metals", "sqls" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		handlers = handlers,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 250,
		},
	})
end

require("rust-tools").setup({
	tools = { hover_actions = {
		border = border,
		auto_focus = false,
	} },
	server = {
		on_attach = on_attach,
		handlers = {
			["textDocument/signatureHelp"] = vim.lsp.with(
				vim.lsp.handlers.signature_help,
				{ border = border, focusable = false }
			),
		},
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 250,
		},
	},
})

nvim_lsp.pyright.setup({
	on_attach = on_attach,
	handlers = handlers,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 250,
	},
	settings = {
		python = {
			venvPath = "/home/equalis3r/.cache/pypoetry/virtualenvs",
			analysis = {
				typeCheckingMode = "off",
			},
		},
	},
})

nvim_lsp.jdtls.setup({
	on_attach = on_attach,
	handlers = handlers,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 250,
	},
	cmd = {
		"/usr/bin/java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"-Xmx2G",
		"-jar",
		"/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_1.6.300.v20210813-1054.jar",
		"-configuration",
		"/usr/share/java/jdtls/config_linux",
		"-data",
		"/home/equalis3r/projects/java" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
	},
	settings = {
		java = { format = { enabled = false } },
	},
})

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup({
	cmd = { "lua-language-server" },
	on_attach = on_attach,
	handlers = handlers,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				pat = runtime_path,
			},
			diagnostics = { globals = { "vim" } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
})
