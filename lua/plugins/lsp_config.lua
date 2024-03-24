local function config_lsp()
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = { "rust_analyzer", "lua_ls" },
    })

    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- rust-analyzer
    lspconfig.rust_analyzer.setup {
        capabilities = capabilities,
        settings = {
            ["rust-analyzer"] = {
                imports = {
                    granularity = {
                        group = "module",
                    },
                    prefix = "self",
                },
                cargo = {
                    buildScripts = {
                        enable = true,
                    },
                },
                procMacro = {
                    enable = true
                },
            },
        }
    }

    -- lua_ls
    lspconfig.lua_ls.setup {}

    local wk = require("which-key")

    -- Global ma-- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    wk.register({
        name = "diagnostic",
        ["[d"] = { vim.diagnostic.goto_prev, "Go To Previous Diagnostic" },
        ["]d"] = { vim.diagnostic.goto_next, "Go To Next Diagnostic" },
        ["<leader>"] = {
            e = { vim.diagnostic.open_float, "Open Diagnostic" },
            q = { vim.diagnostic.setloclist, "Add Diagnostics To Location List" },
        }
    })

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            wk.register({
                g = {
                    name = "Goto",
                    D = { vim.lsp.buf.declearation, "Go To Declearation" },
                    d = { vim.lsp.buf.definition, "Go To Definition" },
                    i = { vim.lsp.buf.implementation, "Go To Implementation" },
                    r = { vim.lsp.buf.references, "Find Reference" },
                },
                ["<leader>"] = {
                    w = {
                        name = "Workspace",
                        a = { vim.lsp.buf.add_workspace_folder, "Add Workspace Folder" },
                        r = { vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder" },
                        l = { function()
                            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                        end, "List Workspace Folder" },
                    },
                    K = { vim.lsp.buf.hover, "Hover(Show Information)" },
                    D = { vim.lsp.buf.type_definition, "Go To Type Definition" },
                    rn = { vim.lsp.buf.rename, "Rename Symbol" },
                    fo = { function()
                        vim.lsp.buf.format { async = true }
                    end, "Reformat Code" },
                    ca = { vim.lsp.buf.code_action, "Code Action" },
                    ["<C-k>"] = { vim.lsp.buf.signature_help, "Signature Help" }
                }
            }, { buffer = ev.buf })
        end,
    })
end

return {
    {
        "williamboman/mason.nvim",
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = config_lsp
    },
}
