local function lsp_keymaps(buf)
    local opts = { buffer = buf, silent = true, noremap = true }

    local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
    end

    -- LSP
    map("n", "gD", vim.lsp.buf.declaration, "Go To Declaration")
    map("n", "gd", vim.lsp.buf.definition, "Go To Definition")
    map("n", "gi", vim.lsp.buf.implementation, "Go To Implementation")
    map("n", "gr", vim.lsp.buf.references, "Find Reference")
    map("n", "K", vim.lsp.buf.hover, "Hover (Show Information)")
    map("n", "D", vim.lsp.buf.type_definition, "Go To Type Definition")

    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add Workspace Folder")
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder")
    map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "List Workspace Folder")

    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map("n", "<leader><C-k>", vim.lsp.buf.signature_help, "Signature Help")

    -- Diagnostics
    map("n", "[d", vim.diagnostic.goto_prev, "Go To Previous Diagnostic")
    map("n", "]d", vim.diagnostic.goto_next, "Go To Next Diagnostic")
    map("n", "<leader>e", vim.diagnostic.open_float, "Open Diagnostic")
    map("n", "<leader>q", vim.diagnostic.setloclist, "Add Diagnostics To Location List")
end


local function config()
    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            lsp_keymaps(args.buf)
        end
    })
end

return {
    {
        "neovim/nvim-lspconfig",
        config = config
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    }
}
