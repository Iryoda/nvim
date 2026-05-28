local ok, treesitter = pcall(require, "nvim-treesitter")

if not ok then
	return
end

local ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" }

treesitter.install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("UserTreesitterHighlight", { clear = true }),
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})
