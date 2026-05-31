local ok, treesitter = pcall(require, "nvim-treesitter")

if not ok then
    return
end


treesitter.install {
    "c",
    "javascript",
    "lua",
    "markdown",
    "markdown_inline",
    "query",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
}
