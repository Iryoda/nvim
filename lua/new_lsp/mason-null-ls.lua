local _, _ = pcall(require, "mason")
local _, null_ls = pcall(require, "null-ls")
local ok, mason_null_ls = pcall(require, "mason-null-ls")

if not ok then
	return
end

mason_null_ls.setup({
	ensure_installed = { "stylua", "jq", "eslint_d", "prettierd" },
	automatic_setup = true,
	handlers = {},
})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettierd.with({
			extra_filetypes = { "svelte" },
		}),
		null_ls.builtins.diagnostics.eslint_d.with({
			only_local = "node_modules/.bin",
			condition = function(utils)
				return utils.root_has_file({ "eslintrc" })
			end,
		}),
	},
})

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
-- local handle = function(client, bufnr)
-- 	if client.supports_method("textDocument/formatting") then
-- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
-- 		vim.api.nvim_create_autocmd("BufWritePre", {
-- 			group = augroup,
-- 			buffer = bufnr,
-- 			callback = function()
-- 				vim.lsp.buf.format({
-- 					bufnr = bufnr,
-- 					filter = function(cli)
-- 						return cli.name == "null-ls"
-- 					end,
-- 				})
-- 			end,
-- 		})
-- 	end
-- end

-- null_ls.setup({
-- 	sources = {
-- 		null_ls.builtins.diagnostics.eslint_d,
-- 	},
-- })
