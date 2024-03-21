local _, lspzero = pcall(require, "lsp-zero")
local ok, lspconfig = pcall(require, "lspconfig")

if not ok then
	return
end

lspzero.preset({
	manage_nvim_cmp = {
		set_sources = "minimal",
	},
})

lspzero.ensure_installed({
	"elixirls",
	"gopls",
	"tsserver",
	"rust_analyzer",
})

lspzero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false, noremap = true }
	local bind = vim.keymap.set

	if client.name ~= "elixirls" then
		client.server_capabilities.documentFormattingProvider = false
	end

	bind("n", "gd", vim.lsp.buf.definition, opts)
	bind("n", "gD", vim.lsp.buf.declaration, opts)
	bind("n", "gi", vim.lsp.buf.implementation, opts)
	bind("n", "gr", vim.lsp.buf.references, opts)
	bind("n", "<space>D", vim.lsp.buf.type_definition, opts)
	bind("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, opts)

	bind("n", "<Leader>r", "<cmd>Lspsaga rename<CR>", { silent = true, noremap = true })
	bind("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true, noremap = true })
	bind("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true, noremap = true })
	bind("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true, noremap = true })
	bind("n", "<Leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true, noremap = true })
	bind("n", "<Leader>e", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true, noremap = true })
	bind("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts)
	bind("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

	lspzero.buffer_autoformat()
end)

-- lsp.configure("elixirls", {
-- 	settings = {
-- 		elixirLS = {
-- 			dialyzerEnabled = true,
-- 			fetchDeps = true,
-- 		},
-- 	},
-- })

lspzero.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "use", "log" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
})

lspzero.setup()

lspconfig.gleam.setup({})

vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "● " },
	severity_sort = false,
	float = true,
})

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})
