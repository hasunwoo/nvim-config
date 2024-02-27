local function config_visual_multi()
    -- disable backspace mapping for compatibility with nvim-autopairs
    vim.g.VM_maps = {
        ["I BS"] = '',
    }
end

return {
    "mg979/vim-visual-multi",
    config = config_visual_multi
}

