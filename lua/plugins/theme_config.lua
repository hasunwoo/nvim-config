local M = {}

function M.load()
    return {
        {
            "folke/tokyonight.nvim",
            lazy = false,
            priority = 1000,
            opts = {}
        },
    }
end

function M.setup()
    vim.cmd[[colorscheme tokyonight-night]]

    -- tokyonight
    require("tokyonight").setup({
        style = "night"
    })
end

return M


