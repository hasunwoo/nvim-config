local function config_nvim_tree()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 30,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = false,
        },
        git = {
            ignore = false,
        },
        -- nvim-tree root is synchronized with current working directory
        sync_root_with_cwd = true,
    })

    local api = require("nvim-tree.api")

    -- toggle nvim-tree
    vim.keymap.set('', '<leader>fe', api.tree.toggle, { noremap = true, silent = true, desc = "Toggle File Explorer" })
end

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = config_nvim_tree
}
