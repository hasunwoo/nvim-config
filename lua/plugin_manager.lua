local M = {}

function get_plugin_info(plugin)
    -- check if plugin is returned by plain require()
    if plugin["load"] ~= nil and plugin["setup"] ~= nil then
        return {
            load = plugin["load"],
            setup = plugin["setup"],
        }
    elseif plugin[1] ~= nil and plugin[1]["load"] ~= nil and plugin[1]["setup"] ~= nil and plugin["config"] ~= nil then
        --check if plugin is structured like { require(), config = ... }
        return {
            load = plugin[1]["load"],
            setup = function ()
                plugin[1]["setup"](plugin["config"])
            end,
        }
    end
end

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
    local plugin_infos = {}
    for _, p in ipairs(plugins) do
        table.insert(plugin_infos, get_plugin_info(p))
    end

    -- collect installation list
    local installation_list = {}
    for _, p in ipairs(plugin_infos) do
        for _, e in ipairs(p.load()) do
            table.insert(installation_list, e)
        end
    end

    -- load plugins
    require("lazy").setup(installation_list)

    -- run setup functions
    for _, v in ipairs(plugin_infos) do
        v.setup()
    end
end

return M

