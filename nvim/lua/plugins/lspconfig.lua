return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            local esp32 = require("esp32")

            -- ensure opts.servers exists
            opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, {
                ruff = { autostart = false },
                inlay_hints = { enabled = false },
                clangd = esp32.lsp_config(),
            })

            return opts
        end,
    },
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = {
                "pyright",
                "ruff",
                "clangd",
            },
        },
    },
    -- vim.lsp.config("ccls", {
    --     init_options = {
    --         cache = {
    --             directory = ".ccls-cache",
    --         },
    --         compilationDatabaseDirectory = "build",
    --         index = {
    --             threads = 2,
    --             trackDependencies = true,
    --         },
    --         clang = {
    --             excludeArgs = { "-frounding-math" },
    --         },
    --     },
    -- }),
    -- vim.lsp.enable("ccls"),
}
