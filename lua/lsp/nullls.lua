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
			formatting.clang_format,
			formatting.prismaFmt,

			diagnostics.eslint,
			diagnostics.credo,

			null_ls.builtins.completion.spell,
		},
	})
end

return M
