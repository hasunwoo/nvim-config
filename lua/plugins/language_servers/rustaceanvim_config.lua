local function get_dap_adapter()
    -- Update this path
    local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/'
    local codelldb_path = extension_path .. 'adapter/codelldb'
    local liblldb_path = extension_path .. 'lldb/lib/liblldb'
    local this_os = vim.uv.os_uname().sysname;

    -- The path is different on Windows
    if this_os:find "Windows" then
        codelldb_path = extension_path .. "adapter\\codelldb.exe"
        liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
    else
        -- The liblldb extension is .so for Linux and .dylib for MacOS
        liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
    end

    local cfg = require('rustaceanvim.config')
    return cfg.get_codelldb_adapter(codelldb_path, liblldb_path)
end

local function config_rustaceanvim()
    vim.g.rustaceanvim = function()
        local config = {
            -- most of keymaps are set in nvim-lspconfig
            -- only add keybindings specific to rust.
            server = {
                on_attach = function(client, bufnr)
                    local wk = require("which-key")
                    wk.add({
                        { "<leader>ss", function() vim.cmd.RustLsp("runables") end, buffer = bufnr, desc = "Run cargo project" },
                        { "<leader>sh", function() vim.cmd.RustLsp("run") end,      buffer = bufnr, desc = "Run hovered entry point" },
                    })
                end
            },

            dap = {
                adapter = get_dap_adapter()
            }
        }

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
