local function get_dap_adapter()
    -- load root path from environment variable
    local extension_path = vim.env.VSCODE_LLDB_ROOT
    if extension_path == nil then
        return nil
    end

    -- Update this path
    local codelldb_path = extension_path .. '/adapter/codelldb'
    local liblldb_path = extension_path .. '/lldb/lib/liblldb'
    local this_os = vim.uv.os_uname().sysname;

    -- The path is different on Windows
    if this_os:find "Windows" then
        codelldb_path = extension_path .. "\\adapter\\codelldb.exe"
        liblldb_path = extension_path .. "\\lldb\\bin\\liblldb.dll"
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
            }
        }

        local dap_adapter = get_dap_adapter()

        if dap_adapter ~= nil then
            config["dap"] = {
                adapter = dap_adapter
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
