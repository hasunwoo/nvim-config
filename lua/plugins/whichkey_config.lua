local function config_whichkey()
    require("which-key").setup({
        delay = 0,
        -- do not show mapping warning on startup
        notify = false,
    })
end

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = config_whichkey,
    dependencies = {
        "echasnovski/mini.icons",
    },
}
