local function config_lualine()
    require("lualine").setup {
        options = {
            theme = "tokyonight"
        }
    }
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = config_lualine
}

