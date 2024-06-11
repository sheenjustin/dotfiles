-- Setup for indent-blankline plugin

local vim = vim

local highlight = {
	"RainbowViolet",
	"RainbowBlue",
	"RainbowGreen",
	"RainbowYellow",
	"RainbowOrange",
	"RainbowGray"
}

local hooks = require("ibl.hooks")
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
