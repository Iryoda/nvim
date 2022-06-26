local M = {}

function M.setup()
	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics

	null_ls.setup({
		sources = {

			formatting.stylua,
			formatting.prettier,
			formatting.rustfmt,
			formatting.black,

			diagnostics.credo,
			diagnostics.eslint_d.with({
				only_local = "node_modules/.bin",
			}),

			null_ls.builtins.completion.spell,
		},
	})
end

return M
