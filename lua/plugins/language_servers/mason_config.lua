local function config_mason()
    require("mason").setup()
end

local function config_mason_lspconfig()
    require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "zls", "tsserver" },
    })
end

local function config_mason_dap()
    -- require("mason-nvim-dap").setup({
    --     ensure_installed = { "codelldb" }
    -- })
end


return {
    {
        "williamboman/mason.nvim",
        config = config_mason
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = config_mason_lspconfig
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = config_mason_dap,
    },
}
