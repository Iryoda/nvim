require "nvim-tree".setup(
  {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    ignore_ft_on_setup = {},
    auto_close = true,
    open_on_tab = true,
    update_to_buf_dir = {
      enable = true,
      auto_open = true
    },
    hijack_cursor = false,
    update_cwd = false,
    diagnostics = {
    enable = true,
    icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
     },
    },
    git = {
      enable = true,
      icons = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌"
      }
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {}
    },
    system_open = {
      cmd = nil,
      args = {}
    },
    ignore = {".git", "coverage", "node_modules", ".cache"},
    view = {
      width = 30,
      height = 30,
      side = "right",
      allow_resize = true,
      auto_resize = true,
      mappings = {
        custom_only = false,
        list = {}
      }
    }
  }
)

vim.g.nvim_tree_git_hl = 1
