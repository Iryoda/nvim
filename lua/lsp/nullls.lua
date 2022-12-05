local M = {}

function M.setup()
	local ok, null_ls = pcall(require, "null-ls")

	if not ok then
		return
	end

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics

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
		on_attach = handle,
		sources = {
			formatting.stylua,
			formatting.prettierd,
			formatting.rustfmt,
			formatting.black,
			formatting.cljstyle,
			formatting.gofmt,

			diagnostics.credo,
			diagnostics.eslint_d.with({
				only_local = "node_modules/.bin",
			}),

			-- null_ls.builtins.completion.luasnip,
		},
	})
end

return M
