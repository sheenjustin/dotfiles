local vim = vim

require("telescope").setup {
	pickers = {
		find_files = { hidden = true }
	},
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

require("telescope").load_extension("file_browser")
require("telescope").load_extension("coc")
require('telescope').load_extension('lazygit')
vim.keymap.set('n', '<leader>gg', '<CMD>LazyGit<CR>', {})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
