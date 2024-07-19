local function config_vim_surround()
    local presets = require("which-key.plugins.presets")
    presets.operators["ds"] = "Remove Surround"
    presets.operators["ys"] = "Add Surround"
    presets.operators["yss"] = "Add Surround To Entire Line"
    presets.operators["cs"] = "Change Surround"
end

return {
    "tpope/vim-surround",
    config = config_vim_surround,
}
