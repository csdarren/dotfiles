return {
    -- add gruvbox and configure small overrides to color mappings
    {
        "ellisonleao/gruvbox.nvim",
        opts = {
            contrast = "hard",
            overrides = {
                -- Keywords
                ["@keyword.import"] = { fg = "#fb4934", bold = true },
                ["@include"] = { fg = "#fb4934", bold = true },
                -- Modules (Imports)
                ["@namespace"] = { fg = "#ebdbb2" },
                ["@module"] = { fg = "#fabd2f" },
                ["@type"] = { fg = "#fabd2f" },
                ["@function"] = { fg = "#71c06d" },
                ["@function.call"] = { fg = "#71c06d" },
                ["@constant.python"] = { fg = "#dedbb2", bold = true },
                ["@function.method.call.python"] = { fg = "#71c06d" },
                ["@type.builtin.python"] = { fg = "#458898" },
            },
        },
    },
    -- configure LazyVim to load gruvbox. DO NOT EDIT ANYTHING HERE, this just loads gruvbox using LazyVim
    {
        "LazyVim/LazyVim",
        opts = {
            -- specify options for this plugin
            colorscheme = "gruvbox",
        },
    },
}
