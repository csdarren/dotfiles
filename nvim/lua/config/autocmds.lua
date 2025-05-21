-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
-- Attempt to remove highlighting on hover
--vim.api.nvim_create_autocmd("LspAttach", {
--  callback = function(args)
--    local client = vim.lsp.get_client_by_id(args.data.client_id)
--
--    if client and client.server_capabilities.documentHighlightProvider then
--      vim.cmd([[
--        augroup DisableLspReferenceHighlight
--          autocmd! * <buffer>
--          autocmd CursorHold <buffer> lua vim.lsp.buf.clear_references()
--          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--        augroup END
--      ]])
--    end
--  end,
--})
-- Defaults to 4 space tabs, in all languages/filetypes
return {
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "*" },
        callback = function()
            vim.bo.shiftwidth = 4
            vim.bo.tabstop = 4
            vim.bo.softtabstop = 4
            vim.bo.expandtab = true
        end,
    }),
}
