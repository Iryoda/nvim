local _, mason = pcall(require, "mason")
local ok, mason_lspconfig = pcall(require, "mason-lspconfig")

if not ok then
	return
end

mason.setup({})
mason_lspconfig.setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = { "rust_analyzer", "gopls", "lua_ls", "elixirls" },
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})
