-- CATPPUCIN
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = true,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = true,            -- Force no italic
    no_bold = false,             -- Force no bold
    styles = {
        comments = { "italic" }, -- Change the style of comments
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = { "bold" },
        properties = {},
        types = {},
        operators = {},
        miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    default_integrations = true,
    color_overrides = {},
    integrations = {
        treesitter = true,
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        ts_rainbow = true,
        lsp_saga = true,
    },
    custom_highlights = function(cp)
        return {
            -- For native lsp configs.
            LspFloatWinNormal = { bg = cp.base },
            DiagnosticVirtualTextError = { bg = cp.none },
            DiagnosticVirtualTextWarn = { bg = cp.none },
            DiagnosticVirtualTextInfo = { bg = cp.none },
            DiagnosticVirtualTextHint = { fg = cp.rosewater, bg = cp.none },

            ["@tag.attribute"] = { fg = cp.mauve, style = { "italic" } },
            ["@tag"] = { fg = cp.blue },
            ["@tag.delimiter"] = { fg = cp.maroon },
        }
    end,
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
