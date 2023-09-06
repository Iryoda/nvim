local _, luasnip = pcall(require, "luasnip")
local _, lsp = pcall(require, "lsp-zero")
local _, _ = pcall(require, "cmp.utils.keymap")
local ok, kind = pcall(require, "lspkind")

if not ok then
	return
end

local cmp = require("cmp")

-- local has_words_before = function()
-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
-- 	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

local source_names = {
	nvim_lsp = "[LSP]",
	path = "[Path]",
	luasnip = "[Snippet]",
	buffer = "[Buffer]",
	tmux = "[TMUX]",
	treesitter = "[TreeSitter]",
}

local cmp_config = lsp.defaults.cmp_config({
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = kind.cmp_format({
			mode = "symbol", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

			before = function(entry, vim_item)
				vim_item.menu = source_names[entry.source.name]
				return vim_item
			end,
		}),
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
	{
		{ name = "buffer" },
	},
})

cmp.setup(cmp_config)

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- cmp.setup.cmdline(":", {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = cmp.config.sources({
-- 		{ name = "path" },
-- 	}, {
-- 		{ name = "cmdline" },
-- 	}),
-- })
--
--
--

-- -- from: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#intellij-like-mapping
-- ["<Tab>"] = cmp.mapping(function(fallback)
-- 	-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
-- 	if cmp.visible() then
-- 		print("cmp visible")
-- 		local entry = cmp.get_selected_entry()
-- 		if not entry then
-- 			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
-- 		else
-- 			cmp.confirm()
-- 		end
-- 	elseif luasnip.expand_or_jumpable() then
-- 		luasnip.expand_or_jump()
-- 	else
-- 		if vim.fn.pumvisible() == 0 then
-- 			vim.api.nvim_feedkeys(keymap.t("<C-z>"), "in", true)
-- 		else
-- 			vim.api.nvim_feedkeys(keymap.t("<C-n>"), "in", true)
-- 		end
-- 	end
-- end, { "i", "s", "c" }),
-- ["<S-Tab>"] = cmp.mapping(function(fallback)
-- 	if cmp.visible() then
-- 		cmp.select_prev_item()
-- 	elseif luasnip.jumpable(-1) then
-- 		luasnip.jump(-1)
-- 	else
-- 		if vim.fn.pumvisible() == 0 then
-- 			vim.api.nvim_feedkeys(keymap.t("<C-z><C-p><C-p>"), "in", true)
-- 		else
-- 			vim.api.nvim_feedkeys(keymap.t("<C-p>"), "in", true)
-- 		end
-- 	end
-- end, { "i", "s" }),
