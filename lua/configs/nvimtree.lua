local g = vim.g

local config = {
  side = "right",
  width = 30,
  show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
    tree_width = 30
  },
  ignore = {".git", "coverage", "node_modules", ".cache"},
  auto_open = 1,
  auto_close = 1,
  quit_on_open = 0,
  follow = 1,
  hide_dotfiles = 0,
  git_hl = 1,
  root_folder_modifier = ":t",
  tab_open = 0,
  allow_resize = 1,
  lsp_diagnostics = 1,
  auto_ignore_ft = {"startify", "dashboard"},
  icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = "",
      staged = "S",
      unmerged = "",
      renamed = "➜",
      deleted = "",
      untracked = "U",
      ignored = "◌"
    },
    folder = {
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = ""
    }
  }
}

for opt, val in pairs(config) do
  g["nvim_tree_" .. opt] = val
end
