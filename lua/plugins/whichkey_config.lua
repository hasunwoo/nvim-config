local function config_whichkey()
    require("which-key").setup()
end

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = true
    end,
    config = config_whichkey
}
