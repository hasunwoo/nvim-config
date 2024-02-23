local M = {}

function M.load()
    return {
        {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.5",
            dependencies = { "nvim-lua/plenary.nvim" }
        },
    }
end

function M.setup()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<space>ff', builtin.find_files, {})
    vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<space>fb', builtin.buffers, {})
    vim.keymap.set('n', '<space>fh', builtin.help_tags, {})
end

return M
