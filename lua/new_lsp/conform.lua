local ok, conform = pcall(require, "conform")

if not ok then
	return
end

local prettier = { { "prettierd", "prettier" } }

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },

		javascript = prettier,
		typescript = prettier,
		typescriptreact = prettier,
		javascriptreact = prettier,
		svelte = prettier,
		json = prettier,

		rust = { "rustfmt" },
		gleam = { "gleamfmt" },
		go = { "gofmt" },

		-- kotlin = { "ktlint" },
	},
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 500,
	},
})
