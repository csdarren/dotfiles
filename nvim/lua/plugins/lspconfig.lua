local esp32 = require("esp32")
return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers = opts.servers or {}

            -- only use esp32 clangd if in esp32 project
            if esp32.find_esp_clangd() and vim.fn.filereadable("sdkconfig") == 1 then
                opts.servers.clangd = esp32.lsp_config()
            end

            opts.servers.ruff = { autostart = false }
            opts.inlay_hints = { enabled = false }
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
}
