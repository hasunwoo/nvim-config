_G.LoadSecrets = function()
    local secrets_file = vim.fn.stdpath("config") .. "/secrets.lua"
    local file = io.open(secrets_file, 'r')

    if file then
        file:close()
        local secrets = loadfile(secrets_file)()
        return secrets
    else
        return nil
    end
end

require(".").setup()
