--local esp32 = require("esp32")
return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                --   clangd = esp32.lsp_config(),
                ruff = { autostart = false },
            },
        },
    },
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = {
                "pyright",
                "ruff",
            },
        },
    },
}
