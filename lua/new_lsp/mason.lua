local _, mason = pcall(require, "mason")
local ok, mason_lspconfig = pcall(require, "mason-lspconfig")

if not ok then
    return
end

mason.setup({})
mason_lspconfig.setup({
    ensure_installed = { "rust_analyzer", "gopls", "lua_ls", "elixirls", "eslint", "ts_ls" },
})
