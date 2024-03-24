local function config_telescope()
    local builtin = require('telescope.builtin')
    local wk = require("which-key")
    wk.register({
        name = "telescope",
        f = {
            f = { builtin.find_files, "Find File" },
            r = { builtin.oldfiles, "Find Recent Files" },
            g = { builtin.live_grep, "Live Grep" },
            b = { builtin.buffers, "Find Buffer" },
            h = { builtin.help_tags, "Find Help" },
        }
    }, { prefix = "<leader>" })
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
