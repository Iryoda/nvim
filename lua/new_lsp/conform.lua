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
        -- ktpls formats Kotlin (through ktlint), via lsp_format = "fallback"
        kotlin = {},
    },
    format_on_save = function(bufnr)
        -- ktlint is a JVM: ~500ms per file, a few seconds for large ones
        local timeout_ms = vim.bo[bufnr].filetype == "kotlin" and 10000 or 500
        return { lsp_format = "fallback", timeout_ms = timeout_ms }
    end,
})
