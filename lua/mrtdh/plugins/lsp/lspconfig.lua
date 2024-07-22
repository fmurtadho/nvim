local tsserver_diagnostics = {
	ignoredCodes = {
		-- These can be found here:
		-- https://github.com/microsoft/TypeScript/blob/master/src/compiler/diagnosticMessages.json

		6133, -- "X Is declared but its value is enver read"
		80001, -- "This is a CommonJS file"
		80005, -- "This require may be converted to an import"
		80006, -- "This may be converted to an async function"
		7016, -- "Could not find a declaration file for module '{0}'. '{1}' implicitly has an 'any' type"
	},
}

local tsserver_settings = {
	-- NOTE: For whatever reason, these don't seem to be respected...
	javascript = {
		showUnused = false,
		suggestionActions = {
			enabled = false,
		},
	},
	typescript = {
		showUnused = false,
	},

	-- So for now ignore specific annoying ones
	diagnostics = tsserver_diagnostics,
}

return {
  "neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local lspconfig = require("lspconfig")
		lspconfig.tsserver.setup({
			capabilities = capabilities,
			settings = tsserver_settings,
		})
		lspconfig.html.setup({
			capabilities = capabilities,
		})
		lspconfig.lua_ls.setup({
      capabilities = capabilities,
			autostart = false,
			settings = {
				Lua = {
					format = {
            enable = false,
						defaultConfig = {},
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
				},
			},
		})
		lspconfig.eslint.setup({
			on_attach = function(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
		})

		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
	end,
}
