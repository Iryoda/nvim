local ok, conform = pcall(require, "conform")

if not ok then
    return
end

local prettier = { "prettierd", "prettier", stop_after_first = true }

conform.setup({
    formatters_by_ft = {
        c = {},
        lua = { "stylua" },
        python = { "black" },

        javascript = prettier,
        typescript = prettier,
        typescriptreact = prettier,
        javascriptreact = prettier,
        svelte = prettier,
        json = prettier,

        rust = { "rustfmt" },
        go = { "gofmt" },
    },
    format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
    },
})
