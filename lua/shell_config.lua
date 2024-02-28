local M = {}

function M.setup()
    local os = vim.loop.os_uname().sysname
    if os == "Windows_NT" then
        -- Set PowerShell as the shell
        vim.o.shell = "powershell.exe"
        vim.o.shellxquote = ""

        -- Configure shell flags for PowerShell
        -- Fixes encoding issue
        vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command'
        vim.o.shellquote = ""

        -- Configure output redirection for PowerShell
        vim.o.shellpipe = '| Out-File -Encoding UTF8 %s'
        vim.o.shellredir = '| Out-File -Encoding UTF8 %s'
    end
end

return M
