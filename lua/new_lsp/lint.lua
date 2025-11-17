local ok, nvim_lint = pcall(require, "lint")

if not ok then
    return
end

nvim_lint.linters_by_ft = {
    javascript = { "eslint" },
    typescript = { "eslint" },
    javascriptreact = { "eslint" },
    typescriptreact = { "eslint" },
    svelte = { "eslint" },
}

local augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
    group = augroup,
    callback = function()
        nvim_lint.try_lint()
    end,
})
