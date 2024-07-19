local M = {}

local indent_augroup = vim.api.nvim_create_augroup("FileTypeIndentSettings", { clear = true })

local function set_filetype_options(ft, settings)
    local ft_list = ft
    if type(ft) == "string" then
        ft_list = { ft }
    end
    for _, filetype in ipairs(ft_list) do
        vim.api.nvim_create_autocmd("FileType", {
            group = indent_augroup,
            pattern = filetype,
            callback = function()
                local bufnr = vim.api.nvim_get_current_buf()
                for option, value in pairs(settings) do
                    vim.bo[bufnr][option] = value
                end
            end
        })
    end
end

function M.setup()
    set_filetype_options({ "javascript", "typescript", "javascriptreact", "typescriptreact" }, {
        tabstop = 2,
        shiftwidth = 2,
        expandtab = true,
    })
    set_filetype_options({ "html", "css" }, {
        tabstop = 2,
        shiftwidth = 2,
        expandtab = true,
    })
end

return M
