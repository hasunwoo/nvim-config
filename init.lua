local config_path = vim.fn.stdpath("config")
local is_vscode = vim.fn.exists("g:vscode") ~= 0 

function load_vimscript(path)
    vim.cmd("source " .. config_path .. "/" .. path)
end

-- load options.vim
load_vimscript("options.vim")

-- load keymaps.vim
load_vimscript("keymaps.vim")

if not is_vscode then
    require("plugin_manager")
    require("telescope_config")
    require("lsp_config")
    require("theme_config")
end

