local M = {}

function M.setup(plugins)
    -- init lazy.nvim plugin manager
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
      vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
      })
    end
    vim.opt.rtp:prepend(lazypath)

    -- collect plugin info
    local plugin_load_infos = {}
    for _, p in ipairs(plugins) do
        for _, e in ipairs(p.load()) do
            table.insert(plugin_load_infos, e)
        end
    end

    -- load plugins
    require("lazy").setup(plugin_load_infos)

    -- run setup functions
    for _, v in ipairs(plugins) do
        if v["config"] ~= nil then
            v.setup(v["config"])
        else
            v.setup()
        end
    end
end

return M

