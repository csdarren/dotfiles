-- Formatting settings. Set formatters to use with each language specified.
-- You can find more formatters by pressing '<leader>cm' (This uses Mason to install formatters)
-- CHECK :ConformInfo to see if the formatter is working
return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff" }, -- Conform will run multiple formatters sequentially

                -- Conform will run the first available formatter
                -- javascript = { "prettierd", "prettier", stop_after_first = true },
            },
            formatters = {
                -- this is where you can change specific settings for a formatter. e.g. changing line length to prevent code from switching lines after a certain length
            },
        },
    },
}
