local M = {}

local config_path = vim.fn.stdpath("config")

local function load_vimscript(path)
    vim.cmd("source " .. config_path .. "/lua/legacy/" .. path)
end

function M.setup()
    load_vimscript("commands.vim")
    load_vimscript("keymaps.vim")
    load_vimscript("options.vim")
end

return M
