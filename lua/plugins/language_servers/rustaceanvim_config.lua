local function config_rustaceanvim()
    vim.g.rustaceanvim = function()
        local config = {
            -- most of keymaps are set in nvim-lspconfig
            -- only add keybindings specific to rust.
            server = {
                on_attach = function(client, bufnr)
                    local wk = require("which-key")
                    wk.add({
                        { "<leader>ss", function() vim.cmd.RustLsp("run") end,       buffer = buf, desc = "Run cargo project" },
                        { "<leader>sh", function() vim.cmd.RustLsp("runnables") end, buffer = buf, desc = "Run hovered entry point"},
                    })
                end
            },
            dap = {
                adapter = require("dap").adapters.codelldb
            }
        }

        local dap = require("dap")

        if dap.adapters["codelldb"] ~= nil then
            config["dap"] = {
                adapter = require("dap").adapters.codelldb
            }
        end

        return config
    end
end

return {
    "mrcjkb/rustaceanvim",
    -- version = '^4', -- Recommended
    lazy = false, -- This plugin is already lazy
    dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap",
    },
    config = config_rustaceanvim
}
