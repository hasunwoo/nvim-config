local function config_lsp()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- rust-analyzer
    -- lspconfig.rust_analyzer.setup {
    --     capabilities = capabilities,
    --     settings = {
    --         ["rust-analyzer"] = {
    --             imports = {
    --                 granularity = {
    --                     group = "module",
    --                 },
    --                 prefix = "self",
    --             },
    --             cargo = {
    --                 buildScripts = {
    --                     enable = true,
    --                 },
    --             },
    --             procMacro = {
    --                 enable = true
    --             },
    --         },
    --     }
    -- }

    -- zls(zig)
    lspconfig.zls.setup {
        capabilities = capabilities,
    }

    -- lua_ls
    lspconfig.lua_ls.setup {
        capabilities = capabilities,
    }

    -- tsserver
    lspconfig.tsserver.setup {
        capabilities = capabilities,
        provideFormatter = false,
    }

    -- cssls
    do
        --Enable (broadcasting) snippet capability for completion
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        lspconfig.cssls.setup {
            capabilities = capabilities,
            provideFormatter = false,
        }
    end

    -- emmet_ls
    lspconfig.emmet_language_server.setup {}

    local wk = require("which-key")

    -- Global ma-- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    wk.add({
        { "[d",        vim.diagnostic.goto_prev,  desc = "Go To Previous Diagnostic" },
        { "]d",        vim.diagnostic.goto_next,  desc = "Go To Next Diagnostic" },
        { "<leader>e", vim.diagnostic.open_float, desc = "Open Diagnostic" },
        { "<leader>q", vim.diagnostic.setloclist, desc = "Add Diagnostics To Location List" },
    })

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            -- buffer to attach
            local buf = ev.buf
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            wk.add({
                { "gD",         vim.lsp.buf.declearation,            buffer = buf, desc = "Go To Declearation" },
                { "gd",         vim.lsp.buf.definition,              buffer = buf, desc = "Go To Definition" },
                { "gi",         vim.lsp.buf.implementation,          buffer = buf, desc = "Go To Implementation" },
                { "gr",         vim.lsp.buf.references,              buffer = buf, desc = "Find Reference" },
                { "K",          vim.lsp.buf.hover,                   buffer = buf, desc = "Hover(Show Information)" },
                { "D",          vim.lsp.buf.type_definition,         buffer = buf, desc = "Go To Type Definition" },
                { "<leader>wa", vim.lsp.buf.add_workspace_folder,    buffer = buf, desc = "Add Workspace Folder" },
                { "<leader>wr", vim.lsp.buf.remove_workspace_folder, buffer = buf, desc = "Remove Workspace Folder" },
                {
                    "<leader>wl",
                    function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end,
                    buffer = buf,
                    desc = "List Workspace Folder"
                },
                { "<leader>rn",    vim.lsp.buf.rename,         buffer = buf, desc = "Rename Symbol" },
                { "<leader>ca",    vim.lsp.buf.code_action,    buffer = buf, desc = "Code Action" },
                { "<leader><C-k>", vim.lsp.buf.signature_help, buffer = buf, desc = "Signature Help" },
            })

            -- use conform for formatting instead
            -- wk.add({
            --     {
            --         "<leader>rf",
            --         function()
            --             vim.lsp.buf.format { async = true }
            --         end,
            --         buffer = buf,
            --         desc = "Reformat Code"
            --     }
            -- })
        end,
    })
end

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = config_lsp,
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "sbdchd/neoformat",
    },
}
