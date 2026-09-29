local ok, lspsaga = pcall(require, "lspsaga")

if not ok then
    return
end

lspsaga.setup({
    symbol_in_winbar = {
        enable = false,
    },
    lightbulb = {
        enable = true,
        sign = false,
    },
    finder = {
        max_height = 0.6,
        left_width = 0.3,
        default = "ref+imp",
        layout = "float",
        keys = {
            shuttle = "<Tab>",
            toggle_or_open = "<CR>",
            vsplit = "v",
            split = "s",
            tabe = "t",
            quit = { "q", "<Esc>" },
            close = "<C-c>",
        },
    },
})
