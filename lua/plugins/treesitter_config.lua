local function config_treesitter()
    require("nvim-treesitter.configs").setup {
        -- A list of parser names, or "all" (the five listed parsers should always be installed)
        ensure_installed = {
            "c", "lua", "rust", "vim", "vimdoc",
            "java", "javascript", "toml", "json", "python",
            "html", "typescript", "svelte", "vue", "php",
            "markdown", "xml", "yaml"
        },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        indent = {
            enabled = true,
        },

        -- List of parsers to ignore installing (or "all")
        ignore_install = {},

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<CR>",
                node_incremental = "<CR>",
                scope_incremental = false,
                node_decremental = "<bs>",
            }
        },

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    }

    local wk = require("which-key")
    wk.add({
        { "<CR>", desc = "Init/Increase Selection" },
        { "<bs>", desc = "Decrease Selection" },
    })
end

return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects"
    },
    build = ":TSUpdate",
    config = config_treesitter
}
