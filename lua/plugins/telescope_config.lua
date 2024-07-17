local function config_telescope()
    local builtin = require('telescope.builtin')
    local wk = require("which-key")

    -- Mapping for find files
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, silent = true, desc = "Find File" })

    -- Mapping for find recent files
    vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { noremap = true, silent = true, desc = "Find Recent Files" })

    -- Mapping for live grep
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true, silent = true, desc = "Live Grep" })

    -- Mapping for find buffers
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true, silent = true, desc = "Find Buffer" })

    -- Mapping for find help
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, silent = true, desc = "Find Help" })

    -- Mapping for find keymaps
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { noremap = true, silent = true, desc = "Find Keymaps" })
    -- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    -- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    -- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
end

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = config_telescope
}
