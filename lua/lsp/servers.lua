local servers = function()
	return {
		ansiblels = {},
		bashls = {},
		clangd = {},
		cssls = {},
		elixirls = {
			settings = {
				elixirLS = {
					dialyzerEnabled = false,
					fetchDeps = false,
				},
			},
		},
		dockerls = {},
		html = {},
		jsonls = {},
		pyright = {},
		rust_analyzer = {
			settings = {
				["rust-analyzer"] = {
					-- enable clippy on save
					checkOnSave = {
						command = "clippy",
					},
				},
			},
		},
		sumneko_lua = {
			settings = {
				Lua = {
					runtime = {
						-- LuaJIT in the case of Neovim
						version = "LuaJIT",
						path = vim.split(package.path, ";"),
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim", "use", "log" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						},
					},
				},
			},
		},
		tsserver = {},
	}
end

return servers
