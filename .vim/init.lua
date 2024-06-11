local vim = vim -- One warning here instead of a billion later on.
local config_path = vim.fn.stdpath('config') -- should be ~/.config/nvim, which is symlinked to ~/.vim

vim.cmd.source(config_path .. '/vimrc') -- source vimrc for common settings between vim and neovim

-- Set options and global variables
vim.opt.undodir = config_path .. '/undodir'
vim.g.gitblame_date_format = '%Y-%m-%d %H:%M'

local Plug = vim.fn['plug#']
-- No need to call plug#begin as it is called earlier from $config_path/vimrc

Plug('nvim-lua/plenary.nvim')
Plug('kkharji/sqlite.lua')
Plug('nvim-tree/nvim-web-devicons')
Plug('lewis6991/gitsigns.nvim')

Plug('mrjones2014/legendary.nvim')
Plug('folke/which-key.nvim')

Plug('nvim-lualine/lualine.nvim')
Plug('lukas-reineke/indent-blankline.nvim')
Plug('https://gitlab.com/HiPhish/rainbow-delimiters.nvim')
Plug('f-person/git-blame.nvim')
Plug('romgrk/barbar.nvim')

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
Plug('nvim-telescope/telescope.nvim', { ['branch'] = '0.1.x' })
Plug('nvim-telescope/telescope-file-browser.nvim')
Plug('fannheyward/telescope-coc.nvim')
Plug('kdheepak/lazygit.nvim')

vim.call('plug#end')

-- Colorscheme doesn't exist until after plug#end is called.
-- It needs to be called in both vimrc and init.lua
vim.cmd.colorscheme('vim-monokai-tasty')

-- Plugin setup start
require('legendary').setup()
require('which-key').setup()
require('gitblame').setup()
require('gitsigns').setup()

require('lualine').setup {
	options = {
		theme = 'powerline_dark'
	}
}

require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true
	}
}

-- Importing plugins with complicated settings options and keymaps
-- in their own modules under $config_path/lua/
-- NOTE: It is important these modules DO NOT have the same name as the plugin
-- otherwise lua can't figure out which is which.
-- e.g. telescope settings are in lua/tscope.lua

package.path = package.path .. ';' .. config_path .. '/lua/?.lua'

require('bar') -- barbar
require('tscope') -- telescope
require('indentblankline') -- indent-blankline

