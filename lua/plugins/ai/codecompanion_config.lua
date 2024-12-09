local function config_codecompanion()
    vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("v", "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd([[cab cc CodeCompanion]])

    -- Load secrets
    local secrets = LoadSecrets()

    -- Base setup
    local codecompanion_config = {
        strategies = {},
        adapters = {},
    }

    -- Add OpenAI adapter and strategies if API key exists
    if secrets and secrets.OPENAI_API_KEY then
        codecompanion_config.strategies.chat = {
            adapter = "openai",
        }
        codecompanion_config.strategies.inline = {
            adapter = "openai",
        }
        codecompanion_config.adapters.openai = function()
            return require("codecompanion.adapters").extend("openai", {
                env = {
                    api_key = secrets.OPENAI_API_KEY,
                },
                schema = {
                    model = {
                        default = "gpt-4o-mini",
                    },
                },
            })
        end
    end

    require("codecompanion").setup(codecompanion_config)
end

return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = config_codecompanion,
}
