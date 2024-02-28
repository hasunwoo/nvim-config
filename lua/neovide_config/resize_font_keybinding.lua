local M = {}

-- default font size
local defaultFontSize = nil

-- default font
local defaultFontName = nil

-- current font size
local m_fontSize = defaultFontSize

-- current font
local m_fontName = defaultFontName

local function apply_font()
    vim.o.guifont = m_fontName .. ":h" .. m_fontSize
end

local function adjust_font_size(amount)
    m_fontSize = m_fontSize + amount
    apply_font()
end

local function reset_font_size()
    m_fontSize = defaultFontSize
    apply_font()
end

function M.setup(opt)
    -- initialie default font and fontsize
    if opt["defaultFontName"] == nil or opt["defaultFontSize"] == nil then
        return
    end

    defaultFontName = opt.defaultFontName
    defaultFontSize = opt.defaultFontSize

    m_fontName = defaultFontName
    m_fontSize = defaultFontSize

    -- font adjustment keybindings
    vim.keymap.set("n", "<C-->", function() adjust_font_size(-1) end, { silent = true })
    vim.keymap.set("n", "<C-=>", function() adjust_font_size(1) end, { silent = true })
    vim.keymap.set("n", "<C-0>", function() reset_font_size() end, { silent = true })

    vim.keymap.set("i", "<C-->", function() adjust_font_size(-1) end, { silent = true })
    vim.keymap.set("i", "<C-=>", function() adjust_font_size(1) end, { silent = true })
    vim.keymap.set("i", "<C-0>", function() reset_font_size() end, { silent = true })

    vim.keymap.set("i", "<C-ScrollWheelDown>", function() adjust_font_size(-1) end, { silent = true })
    vim.keymap.set("i", "<C-ScrollWheelUp>", function() adjust_font_size(1) end, { silent = true })
    vim.keymap.set("i", "<C-MiddleMouse>", function() reset_font_size() end, { silent = true })

    vim.keymap.set("n", "<C-ScrollWheelDown>", function() adjust_font_size(-1) end, { silent = true })
    vim.keymap.set("n", "<C-ScrollWheelUp>", function() adjust_font_size(1) end, { silent = true })
    vim.keymap.set("n", "<C-MiddleMouse>", function() reset_font_size() end, { silent = true })
end

return M
