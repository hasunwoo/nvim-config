local M = {}

function M.load()
    return {
        {
            "nvim-lualine/lualine.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" }
        },
    }
end

function M.setup()
    require("lualine").setup {
        options = {
            theme = "tokyonight"
        }
    }
end

return M
