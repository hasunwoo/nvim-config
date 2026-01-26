local M = {}

function M.setup()
    require("config.shell").setup()
    require("config.lazy").setup()
end

return M
