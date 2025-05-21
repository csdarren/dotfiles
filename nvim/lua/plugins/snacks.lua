return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        styles = {
            c_term = {
                backdrop = false,
                position = "float",
                border = "rounded",
                title_pos = "center",
                height = 0.8,
                width = 0.8,
                relative = "editor",
                noautocmd = true,
                wo = {
                    winhighlight = "NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle",
                    cursorline = false,
                },
                b = {
                    completion = false, -- disable blink completions in input
                },
                keys = {
                    n_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "n", expr = true },
                    i_esc = { "<esc>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
                    i_cr = { "<cr>", { "cmp_accept", "confirm" }, mode = { "i", "n" }, expr = true },
                    i_tab = { "<tab>", { "cmp_select_next", "cmp" }, mode = "i", expr = true },
                    i_ctrl_w = { "<c-w>", "<c-s-w>", mode = "i", expr = true },
                    i_up = { "<up>", { "hist_up" }, mode = { "i", "n" } },
                    i_down = { "<down>", { "hist_down" }, mode = { "i", "n" } },
                    q = "cancel",
                },
            },
        },
        terminal = { win = { style = "c_term" } },
        dashboard = {
            preset = {
                header = [[
██████╗███████╗██████╗  █████╗ ██████╗ ██████╗ ███████╗███╗   ██╗
██╔════╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝████╗  ██║
██║     ███████╗██║  ██║███████║██████╔╝██████╔╝█████╗  ██╔██╗ ██║
██║     ╚════██║██║  ██║██╔══██║██╔══██╗██╔══██╗██╔══╝  ██║╚██╗██║
╚██████╗███████║██████╔╝██║  ██║██║  ██║██║  ██║███████╗██║ ╚████║
╚═════╝╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝
https://github.com/csdarren/
        ]],
                pick = nil,
                keys = {},
            },
        },
        picker = {
            sources = {
                explorer = {
                    win = {
                        list = {
                            keys = { ["-"] = "explorer_up" },
                        },
                    },
                },
            },
        },
        bigfile = { enabled = true },
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
}
