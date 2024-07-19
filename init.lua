local config_path = vim.fn.stdpath("config")
local plugin_path = "plugins"

local is_vscode = vim.fn.exists("g:vscode") ~= 0

local function load_vimscript(path)
    vim.cmd("source " .. config_path .. "/" .. path)
end

local function require_plugin(path)
    return require(plugin_path .. "/" .. path)
end

-- load options.vim
load_vimscript("options.vim")

-- load keymaps.vim
load_vimscript("keymaps.vim")

-- load commands.vim
load_vimscript("commands.vim")

-- config shell based on os. required to configure powershell on windows properly.
require("shell_config").setup()

-- load neovide config
if vim.g.neovide then
    require("neovide_config").setup()
    require("neovide_config.ime_toggle").setup()
    require("neovide_config.resize_font_keybinding").setup({
        defaultFontName = "Delugia_Mono",
        defaultFontSize = 13,
    })
end

-- load plugins
local plugins = {}

table.insert(plugins, require_plugin("editing/surround_config"))
table.insert(plugins, require_plugin("editing/comment_config"))
-- table.insert(plugins, require_plugin("editing/visual_multi_config"))
table.insert(plugins, require_plugin("tree_sitters/treesitter_config"))
table.insert(plugins, require_plugin("tree_sitters/treesitter_textobject_config"))

if not is_vscode then
    -- initialize easy_escape module(jk, kj to escape)
    -- does not work in vscode neovim because insert mode is processed in vscode not nvim
    -- require("easy_escape").setup()
    table.insert(plugins, require_plugin("whichkey_config"))
    table.insert(plugins, require_plugin("ui/nvim_tree_config"))
    table.insert(plugins, require_plugin("language_servers/lsp_config"))
    table.insert(plugins, require_plugin("language_servers/dap_config"))
    table.insert(plugins, require_plugin("language_servers/mason_config"))
    table.insert(plugins, require_plugin("language_servers/cmp_config"))
    table.insert(plugins, require_plugin("language_servers/rustaceanvim_config"))
    table.insert(plugins, require_plugin("ui/theme_config"))
    table.insert(plugins, require_plugin("ui/lualine_config"))
    table.insert(plugins, require_plugin("ui/telescope_config"))
    table.insert(plugins, require_plugin("ui/fidget_config"))
    table.insert(plugins, require_plugin("editing/autopairs_config"))
    table.insert(plugins, require_plugin("editing/autotag_config"))
end

require("plugin_manager").setup(plugins)
