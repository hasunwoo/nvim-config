local function config_dap()
    local dap = require("dap")

    -- keybindings
    local wk = require("which-key")

    -- widgets
    local widgets = require('dap.ui.widgets')

    local scope_sidebar = widgets.sidebar(widgets.scopes, {}, "botright 30 vsplit")
    -- local scope_sidebar = widgets.sidebar(widgets.scopes)

    wk.add({
        { "<F5>",       function() require('dap').continue() end,          desc = "Continue" },
        { "<F10>",      function() require('dap').step_over() end,         desc = "Step Over" },
        { "<F11>",      function() require('dap').step_into() end,         desc = "Step Into" },
        { "<F12>",      function() require('dap').step_out() end,          desc = "Step Out" },
        { "<leader>b",  function() require('dap').toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        -- { "<leader>B",  function() require('dap').set_breakpoint() end,                                              desc = "Set Breakpoint" },
        -- { "<leader>lp", function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, desc = "Set Log Point" },
        -- { "<leader>dr", function() require('dap').repl.open() end,                                                   desc = "Open REPL" },
        { "<leader>dl", function() require('dap').run_last() end,          desc = "Run Last" },
        {
            mode = { "n", "v" }, -- NORMAL and VISUAL mode
            { "<leader>dh", function() require('dap.ui.widgets').hover() end,   desc = "Hover" },
            { "<leader>dp", function() require('dap.ui.widgets').preview() end, desc = "Preview" },
        },
        {
            "<leader>df",
            function()
                widgets.centered_float(widgets.frames)
            end,
            desc = "Frames"
        },
        {
            "<leader>ds",
            function()
                scope_sidebar.toggle()
            end,
            desc = "Scopes"
        },
    })

    -- initialize codelldb if is is available
    if vim.fn.executable("codelldb") == 1 then
        -- codelldb adapter
        local lldb_port = 12953
        dap.adapters.codelldb = {
            type = "server",
            port = lldb_port,
            executable = {
                command = "codelldb",
                args = { "--port", lldb_port },
            }
        }

        -- rust
        -- dap.configurations.rust = {
        --     {
        --         name = "Launch file",
        --         type = "codelldb",
        --         request = "launch",
        --         program = function()
        --             return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        --         end,
        --         cwd = '${workspaceFolder}',
        --         stopOnEntry = false,
        --     },
        -- }
    end
end

return {
    "mfussenegger/nvim-dap",
    config = config_dap,
}
