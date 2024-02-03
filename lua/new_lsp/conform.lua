local ok, conform = pcall(require, "conform")

if not ok then
	return
end

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },

		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },
		javascriptreact = { { "prettierd", "prettier" } },

		svelte = { { "prettierd", "prettier" } },

		kotlin = { "klint" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
})
