local config_path = vim.fn.stdpath("config")
local plugin_path = "plugins"

local is_vscode = vim.fn.exists("g:vscode") ~= 0 

function load_vimscript(path)
    vim.cmd("source " .. config_path .. "/" .. path)
end

function require_plugin(path)
    return require(plugin_path .. "/" .. path)
end

-- load options.vim
load_vimscript("options.vim")

-- load keymaps.vim
load_vimscript("keymaps.vim")

-- load plugins
local plugins = {}

table.insert(plugins, require_plugin("surround_config"))
table.insert(plugins, require_plugin("visual_multi_config"))

if not is_vscode then
    table.insert(plugins, require_plugin("treesitter_config"))
    table.insert(plugins, require_plugin("lsp_config"))
    table.insert(plugins, require_plugin("cmp_config"))
    table.insert(plugins, require_plugin("theme_config"))
    table.insert(plugins, require_plugin("lualine_config"))
    table.insert(plugins, require_plugin("telescope_config"))
    table.insert(plugins, require_plugin("fidget_config"))
    table.insert(plugins, require_plugin("autopairs_config"))
end

require("plugin_manager").setup(plugins)

