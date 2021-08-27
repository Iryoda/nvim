local actions = require("telescope.actions")
local keymap = vim.api.nvim_set_keymap

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        -- To disable a keymap, put [map] = false
        -- So, to not map "<C-n>", just put
        ["<C-n>"] = false,
        -- Otherwise, just set the mapping to the function that you want it to be.
        ["<C-i>"] = actions.select_horizontal,
        -- Add up multiple actions
        ["<cr>"] = actions.select_default + actions.center
      },
      n = {
        ["<esc>"] = actions.close
      }
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false
      },
      vertical = {
        mirror = false
      }
    },
    file_sorter = require "telescope.sorters".get_fuzzy_file,
    file_ignore_patterns = {"node_modules", "coverage"},
    generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    file_previewer = require "telescope.previewers".vim_buffer_cat.new,
    grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker
  }
}

keymap("n", "<leader>ff", [[<Cmd>lua require'telescope.builtin'.find_files()<CR>]], {})
keymap("n", "<leader>fg", [[<Cmd>lua require'telescope.builtin'.live_grep()<CR>]], {})
keymap("n", "<leader>fb", [[<Cmd>lua require'telescope.builtin'.buffers()<CR>]], {})
keymap("n", "<leader>fh", [[<Cmd>lua require'telescope.builtin'.help_tags()<CR>]], {})
