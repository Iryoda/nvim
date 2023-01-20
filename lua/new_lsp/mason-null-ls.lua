local _, mason_null_ls = pcall(require, "mason-null-ls")
local ok, null_ls = pcall(require, "null-ls")

if not ok then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

mason_null_ls.setup({
	ensure_installed = { "stylua", "jq", "eslint" },
	automatic_setup = true,
})

local handle = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					bufnr = bufnr,
					filter = function(cli)
						return cli.name == "null-ls"
					end,
				})
			end,
		})
	end
end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.mix,
		null_ls.builtins.formatting.cljstyle,

		null_ls.builtins.diagnostics.credo,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.diagnostics.clj_kondo,
	},
	on_attach = handle,
})

mason_null_ls.setup_handlers()
