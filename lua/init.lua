local M = {}

function M.setup()
    require("legacy").setup()
    require("config").setup()
    -- require("personal.easy_escape").setup()
end

return M
