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
})
