vim.lsp.set_log_level(vim.log.levels.ERROR)

local callback = function(args)
    local opts = { buffer = args.buf, remap = false, noremap = true }
    local bind = vim.keymap.set

    bind("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
    bind("n", "gD", vim.lsp.buf.declaration, opts)
    bind("n", "gi", "<cmd>Lspsaga finder imp<CR>", opts)
    bind("n", "gr", "<cmd>Lspsaga finder ref<CR>", opts)
    bind("n", "gR", "<cmd>Lspsaga finder def+imp+ref<CR>", opts)
    bind("n", "<space>D", "<cmd>Lspsaga peek_type_definition<CR>", opts)
    bind("n", "<space>f", function()
        vim.lsp.buf.format({ async = true })
    end, opts)
    bind("n", "<Leader>r", "<cmd>Lspsaga rename<CR>", { silent = true, noremap = true })
    bind("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true, noremap = true })
    bind("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true, noremap = true })
    bind("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true, noremap = true })
    bind("n", "<Leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true, noremap = true })
    bind("n", "<Leader>e", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true, noremap = true })
    bind("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    bind("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = callback
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim", "use", "log" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
        },
    },
})

-- ktpls compiles with Gradle for compiler diagnostics; the projects need
-- JDK 25 (the default java on PATH is 21).
vim.lsp.config("ktpls", {
    init_options = {
        compile = {
            env = { JAVA_HOME = vim.fn.expand("~/.local/share/mise/installs/java/graalvm-community-25.0.2") },
        },
        -- Format like detekt's ktlint wrapper (IntelliJ style); a project's
        -- own .editorconfig still wins
        format = { editorconfig = vim.fn.stdpath("config") .. "/ktlint/editorconfig" },
    },
})

vim.lsp.enable({ "lua_ls", "gleam", "ktpls" })

vim.diagnostic.config({
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "● " },
    severity_sort = false,
    float = true,
})

vim.filetype.add({
    extension = {
        templ = "templ",
    },
})
