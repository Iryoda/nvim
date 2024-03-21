local ok, nvim_lint = pcall(require, "lint")

if not ok then
	return
end

nvim_lint.linters_by_ft = {
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	svelte = { "eslint_d" },
}

local augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
	group = augroup,
	callback = function()
		nvim_lint.try_lint()
	end,
})
