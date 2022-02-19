local M = {}

function M.setup()
	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics

	null_ls.setup({
		sources = {
			null_ls.builtins.diagnostics.eslint.with({
				only_local = "node_modules/.bin",
			}),

			formatting.stylua,
			formatting.prettier,
			formatting.rustfmt,

			diagnostics.eslint,
			diagnostics.credo,

			null_ls.builtins.completion.spell,
		},
	})
end

return M
