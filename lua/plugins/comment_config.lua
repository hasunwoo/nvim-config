local function config_autotag()
    require("Comment").setup()
end

return {
    "numToStr/Comment.nvim",
    config = config_autotag,
    lazy = false,
}
