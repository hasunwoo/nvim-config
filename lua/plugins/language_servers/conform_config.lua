local function config_conform()
    require("conform").setup({
        formatters_by_ft = {
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            json = { "prettier" },
        }
    })

    vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
            local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
            range = {
                start = { args.line1, 0 },
                ["end"] = { args.line2, end_line:len() },
            }
        end
        require("conform").format({ async = true, lsp_format = "fallback", range = range })
    end, { range = true })

    local wk = require("which-key")

    wk.add({
        {
            "<leader>rf",
            function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end,
            desc = "Reformat Code(uses lsp if not configured in config_conform.lua)"
        }
    })
end

return {
    "stevearc/conform.nvim",
    config = config_conform
}
