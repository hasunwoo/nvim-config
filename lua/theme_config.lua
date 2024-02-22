vim.cmd[[colorscheme tokyonight-night]]

-- tokyonight
require("tokyonight").setup({
	style = "night"
})

-- lualine
require("lualine").setup {
	theme = "tokyonight"
}
