local function config_whichkey()
    require("which-key").setup({
        delay = 0
    })
end

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = config_whichkey
}
