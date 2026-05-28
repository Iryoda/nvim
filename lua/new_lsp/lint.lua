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

local eslint_config_files = {
    "eslint.config.js",
    "eslint.config.cjs",
    "eslint.config.mjs",
    "eslint.config.ts",
    "eslint.config.cts",
    "eslint.config.mts",
    ".eslintrc",
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.mjs",
    ".eslintrc.json",
    ".eslintrc.yaml",
    ".eslintrc.yml",
}

local function has_eslint_config(bufnr)
    local path = vim.api.nvim_buf_get_name(bufnr)

    if path == "" then
        return false
    end

    local dir = vim.fs.dirname(path)

    return vim.fs.find(eslint_config_files, {
        path = dir,
        upward = true,
        stop = vim.uv.os_homedir(),
    })[1] ~= nil
end

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
    group = augroup,
    callback = function(args)
        local names = nvim_lint.linters_by_ft[vim.bo[args.buf].filetype]

        if names and vim.tbl_contains(names, "eslint") and not has_eslint_config(args.buf) then
            return
        end

        nvim_lint.try_lint(nil, { ignore_errors = true })
    end,
})
