local vim = vim

require('Comment').setup()
vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)<CR>", {})
vim.keymap.set("x", "<leader>/", "<Plug>(comment_toggle_blockwise_visual)<CR>")
