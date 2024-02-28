local M = {}

function M.setup()
    -- set window transparency
    vim.g.neovide_transparency = 1.0
    -- refresh rate
    vim.g.neovide_refresh_rate = 60
    -- idle refresh rate
    vim.g.neovide_refresh_rate_idle = 5
    -- start app in maximized
    vim.g.neovide_fullscreen = false
    -- recall window size of previous session on startup
    vim.g.neovide_remember_window_size = true
    -- set how long the scroll animation takes to complete
    vim.g.neovide_scroll_animation_length = 0.15
    -- set the time it takes for cursor to complete it's animation
    vim.g.neovide_cursor_animation_length = 0.06
    --sets how much the trail of the cursor lags behind the front edge
    vim.g.neovide_cursor_trail_size = 0.3
end

return M
