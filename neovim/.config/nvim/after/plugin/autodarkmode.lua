-- Auto Dark Mode
local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
	update_interval = 1000,
	set_dark_mode = function()
		vim.api.nvim_set_option('background', 'dark')
        -- To set the background transparent
        vim.api.nvim_set_hl(0, "Normal", {guibg = NONE, ctermbg = NONE})
	end,
	set_light_mode = function()
		vim.api.nvim_set_option('background', 'light')
        -- To set the background transparent
        vim.api.nvim_set_hl(0, "Normal", {guibg = NONE, ctermbg = NONE})
	end,
})
auto_dark_mode.init()
