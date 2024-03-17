local function config_better_escape()
    require("better_escape").setup({
        mapping = { "jk", "kj", "ㅓㅏ", "ㅏㅓ" },
        timeout = 200,
        clear_empty_lines = false,
        keys = "<Esc>",
    })
end

return {
    "max397574/better-escape.nvim",
    config = config_better_escape,
}
