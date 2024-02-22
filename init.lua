local config_path = vim.fn.stdpath("config")

function load_vimscript(path)
    vim.cmd("source " .. config_path .. "/" .. path)
end

-- load options.vim
load_vimscript("options.vim")

require("plugin_manager")
require("telescope_config")
require("lsp_config")
require("theme_config")

