local _, mason = pcall(require, "mason")
local ok, mason_lspconfig = pcall(require, "mason-lspconfig")

if not ok then
    return
end

mason.setup({
    registries = {
        "github:mason-org/mason-registry",
        "lua:ktpls.mason", -- ktpls: built from the local checkout (editors/nvim)
    },
})
mason_lspconfig.setup({
    ensure_installed = { "rust_analyzer", "gopls", "lua_ls", "elixirls", "eslint", "ts_ls" },
})
