local function setup_render_markdown()
end

return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
    event = "VeryLazy",
    config = setup_render_markdown,
}
