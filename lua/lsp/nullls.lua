local M = {}

function M.setup()
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	local null_ls = require("null-ls")
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

			diagnostics.credo,
			diagnostics.eslint_d.with({
				only_local = "node_modules/.bin",
			}),

			null_ls.builtins.completion.spell,
		},
	})
end

return M
