"font size
let s:defaultFontSize = 13

"default font
let s:defaultFont = "Delugia Mono"

"font size
let s:fontsize = s:defaultFontSize

"font
let s:font = s:defaultFont

function! AdjustFontSize(amount)
    let s:fontsize = s:fontsize + a:amount
    :execute "GuiFont! "s:font . ":h" . s:fontsize
endfunction

function! ResetFontSize()
    let s:defaultFont = "Delugia Mono"
    let s:fontsize = s:defaultFontSize
    :execute "GuiFont! "s:font . ":h" . s:fontsize
endfunction

noremap <silent> <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <silent> <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
noremap <silent> <C-MiddleMouse> :call ResetFontSize()<CR>

inoremap <silent> <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <silent> <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a
inoremap <silent> <C-MiddleMouse> <Esc>:call ResetFontSize()<CR>a

noremap <silent> <C-+> :call AdjustFontSize(1)<CR>
noremap <silent> <C--> :call AdjustFontSize(-1)<CR>

inoremap <silent> <C-+> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <silent> <C--> <Esc>:call AdjustFontSize(-1)<CR>a

noremap <silent> <C-=> :call AdjustFontSize(1)<CR>
noremap <silent> <C--> :call AdjustFontSize(-1)<CR>

inoremap <silent> <C-=> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <silent> <C--> <Esc>:call AdjustFontSize(-1)<CR>a

noremap <silent> <C-0> :call ResetFontSize()<CR>
inoremap <silent> <C-0> <Esc>:call ResetFontSize()<CR>a

