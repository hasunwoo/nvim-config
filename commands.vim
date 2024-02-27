" :ConfigCd change current directory to config folder.
function s:ConfigCd()
    lua vim.api.nvim_set_current_dir(vim.fn.stdpath("config"))
endfunction

command ConfigCd call s:ConfigCd()

" :ConfigEdit change current directory to config folder and open init.lua
function s:ConfigEdit()
    call s:ConfigCd()
    execute "edit init.lua"
endfunction
command ConfigEdit call s:ConfigEdit()

