require("nvim-tree").setup({ -- BEGIN_DEFAULT_OPTS
	auto_reload_on_write = true,
	disable_netrw = true,
	hijack_cursor = false,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	ignore_buffer_on_setup = false,
	open_on_setup = false,
	open_on_tab = false,
	sort_by = "name",
	update_cwd = false,
	view = {
		width = 30,
		height = 30,
		side = "right",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		mappings = {
			custom_only = false,
			list = { { key = "<C-e>", action = "close" } },
		},
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	ignore_ft_on_setup = {},
	system_open = {
		cmd = nil,
		args = {},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = false,
		custom = {},
		exclude = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 400,
	},
	actions = {
		change_dir = {
			enable = false,
			global = false,
		},
		open_file = {
			quit_on_open = false,
			resize_window = false,
			window_picker = {
				enable = false,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			git = false,
		},
	},
})

-- require "nvim-tree".setup(
--   {
--     disable_netrw = true,
--     hijack_netrw = true,
--     open_on_setup = true,
--     ignore_ft_on_setup = {},
--     auto_close = true,
--     open_on_tab = true,
--     update_to_buf_dir = {
--       enable = true,
--       auto_open = true
--     },
--     hijack_cursor = false,
--     update_cwd = false,
--     diagnostics = {
--     enable = true,
--     icons = {
--           hint = "",
--           info = "",
--           warning = "",
--           error = "",
--      },
--     },
--     git = {
--       enable = true,
--       icons = {
--         unstaged = "",
--         staged = "S",
--         unmerged = "",
--         renamed = "➜",
--         deleted = "",
--         untracked = "U",
--         ignored = "◌"
--       }
--     },
--     update_focused_file = {
--       enable = true,
--       update_cwd = true,
--       ignore_list = {}
--     },
--     system_open = {
--       cmd = nil,
--       args = {}
--     },
--     ignore = {".git", "coverage", "node_modules", ".cache"},
--     view = {
--       width = 30,
--       height = 30,
--       side = "right",
--       allow_resize = true,
--       auto_resize = true,
--       mappings = {
--         custom_only = false,
--         list = {}
--       }
--     }
--   }
-- )
--
-- vim.g.nvim_tree_git_hl = 1
--
--
--
--
--
