local function config_theme()
    vim.cmd[[colorscheme tokyonight-night]]

    -- tokyonight
    require("tokyonight").setup({
        style = "night"
    })
end

return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = config_theme
}

