local function config_autotag()
    require("nvim-ts-autotag").setup()
end

return {
    "windwp/nvim-ts-autotag",
    config = config_autotag
}

