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

table.insert(plugins, require_plugin("surround_config"))
table.insert(plugins, require_plugin("comment_config"))
-- table.insert(plugins, require_plugin("visual_multi_config"))
table.insert(plugins, require_plugin("treesitter_config"))
table.insert(plugins, require_plugin("treesitter_textobject_config"))

if not is_vscode then
    -- initialize easy_escape module(jk, kj to escape)
    -- does not work in vscode neovim because insert mode is processed in vscode not nvim
    -- require("easy_escape").setup()
    table.insert(plugins, require_plugin("whichkey_config"))
    table.insert(plugins, require_plugin("nvim_tree_config"))
    table.insert(plugins, require_plugin("lsp_config"))
    table.insert(plugins, require_plugin("dap_config"))
    table.insert(plugins, require_plugin("mason_config"))
    table.insert(plugins, require_plugin("cmp_config"))
    table.insert(plugins, require_plugin("theme_config"))
    table.insert(plugins, require_plugin("lualine_config"))
    table.insert(plugins, require_plugin("telescope_config"))
    table.insert(plugins, require_plugin("fidget_config"))
    table.insert(plugins, require_plugin("autopairs_config"))
    table.insert(plugins, require_plugin("autotag_config"))
end

require("plugin_manager").setup(plugins)
