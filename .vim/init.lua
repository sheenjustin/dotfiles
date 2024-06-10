local vim = vim -- One warning here instead of a billion later on.

vim.cmd('source ~/.vim/vimrc')

vim.opt.undodir = '~/.vim/undodir'

vim.g.gitblame_date_format = '%Y-%m-%d %H:%M'

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('legendary').setup()
require('which-key').setup()
require('gitblame').setup()

require('lualine').setup{ options={theme='powerline_dark'} }
require'nvim-treesitter.configs'.setup{highlight={enable=true}}

require("telescope").setup {
	extensions = {
		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hidden = { file_browser = true, folder_browser = true },
			hijack_netrw = true,
			mappings = {
				["i"] = {
				-- your custom insert mode mappings
				},
				["n"] = {
				-- your custom normal mode mappings
				},
			},
		},
		coc = {
    		theme = 'ivy',
    		prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
			push_cursor_on_edit = true, -- save the cursor position to jump back in the future
			timeout = 3000, -- timeout for coc commands
		}
	},
}

require("telescope").load_extension "file_browser"
require("telescope").load_extension "coc"

local highlight = {
	"RainbowViolet",
	"RainbowBlue",
	"RainbowGreen",
	"RainbowYellow",
	"RainbowOrange",
	"RainbowGray"
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#A6E22E" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#66D9EF" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E6DB74" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FD971F" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#AE81FF" })
	vim.api.nvim_set_hl(0, "RainbowGray", { fg = "#75715E" })
end)

require("ibl").setup {
	indent = { highlight = highlight },
	scope = { show_exact_scope = true, highlight = { "Statement" } }
}
