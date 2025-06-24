return {
    {
        "neovim/nvim-lspconfig",
        servers = {
            ruff = { autostart = false },
            inlay_hints = { enabled = false },
        },
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
