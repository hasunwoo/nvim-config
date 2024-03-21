local EscapeState = {
    expires_at = 0,
    waiting = false,
    first_key = '',
    second_key = '',
    cancel_keystroke = "",
    escape_keystroke = "",
    timeout = 200,
}

local function millis()
    return vim.loop.hrtime() / 1000000
end

function EscapeState:new(first_key, second_key, cancel_keystroke, escape_keystroke, timeout)
    local obj = {
        expires_at = 0,
        waiting = false,
        first_key = first_key,
        second_key = second_key,
        cancel_keystroke = cancel_keystroke or "<bs><bs>",
        escape_keystroke = escape_keystroke or "<Esc>",
        timeout = timeout or 200
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function EscapeState:onKey(key)
    -- check second key
    if self.waiting then
        self.waiting = false
        if self.second_key == key and self.expires_at >= millis() then
            -- send keystrokes to cancel and escape
            local keystrokes = self.cancel_keystroke .. self.escape_keystroke
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keystrokes, true, true, true), "n", false)
            return
        end
        -- second key mismatch or timeout. proceed to check first key
    end
    --check first key
    if not self.waiting and self.first_key == key then
        self.waiting = true
        self.expires_at = millis() + self.timeout
    end
end

function EscapeState:cancel()
    self.waiting = false
end

local function register_escape_keymap(mode, keys, handlers)
    for _, key in ipairs(keys) do
        local config = type(key) == "string" and { key = key, simulateRepeat = false } or key
        vim.keymap.set(mode, config.key,
            function()
                -- emulate key insertion
                local repeatCount = config.simulateRepeat and vim.v.count1 or 1
                repeatCount = (repeatCount == 0) and 1 or repeatCount
                for _ = 1, repeatCount do
                    vim.api.nvim_feedkeys(config.key, "n", false)
                end
                -- run handlers
                for _, v in ipairs(handlers) do
                    v:onKey(config.key)
                end
            end,
            { noremap = true, silent = true })
    end
end

local M = {}

function M.setup()
    local timeout = 200

    register_escape_keymap("i", { "j", "k" }, {
        EscapeState:new('j', 'k', nil, "<Esc>", timeout),
        EscapeState:new('k', 'j', nil, "<Esc>", timeout)
    })

    register_escape_keymap("v", {
        { key = "j", simulateRepeat = true },
        { key = "k", simulateRepeat = true }
    }, {
        EscapeState:new('j', 'k', nil, "<Esc>", timeout),
        EscapeState:new('k', 'j', nil, "<Esc>", timeout)
    })

    register_escape_keymap("c", { "j", "k" }, {
        EscapeState:new('j', 'k', "<C-u>", "<Esc>", timeout),
        EscapeState:new('k', 'j', "<C-u>", "<Esc>", timeout)
    })

    register_escape_keymap("t", { "j", "k" }, {
        EscapeState:new('j', 'k', nil, "<C-\\><C-n>", timeout),
        EscapeState:new('k', 'j', nil, "<C-\\><C-n>", timeout)
    })
end

return M
