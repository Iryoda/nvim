local _, snippets = pcall(require, "mini.snippets")
local _, icons = pcall(require, "mini.icons")
local ok, completion = pcall(require, "mini.completion")

if not ok then
    return
end

icons.setup({})
snippets.setup({})
completion.setup({})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "fff_input",
	callback = function()
		vim.b.minicompletion_disable = true
	end,
})
