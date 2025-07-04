-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remap Space + y to copy to the clipboard instead of vim buffer
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { noremap = true, silent = true })

-- Remap Space + p to paste from the clipboard instead of vim buffer
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { noremap = true, silent = true })

-- Remap Space + I to execute command :Inspect in command mode
vim.keymap.set({ "n" }, "<leader>I", ":Inspect<CR>", { noremap = true, silent = true })

-- Move cursor to original position after undoing or redoing
vim.keymap.set("n", "U", function()
    local curpos = vim.api.nvim_win_get_cursor(0)
    vim.cmd("redo")
    vim.api.nvim_win_set_cursor(0, curpos)
end, { desc = "Redo without moving cursor" })

vim.keymap.set("n", "u", function()
    local curpos = vim.api.nvim_win_get_cursor(0)
    vim.cmd("undo")
    vim.api.nvim_win_set_cursor(0, curpos)
end, { desc = "Undo without moving cursor" })

-- Platform IO
vim.keymap.set({ "n", "v" }, "<leader>jt", ":Piocmdf<CR>", { noremap = true, silent = true, desc = "Terminal" })
vim.keymap.set({ "n", "v" }, "<leader>ji", ":Pioinit<CR>", { noremap = true, silent = true, desc = "Init Project" })
vim.keymap.set({ "n", "v" }, "<leader>jr", ":Piorun<CR>", { noremap = true, silent = true, desc = "Run Project" })
vim.keymap.set({ "n", "v" }, "<leader>jd", ":Piodebug<CR>", { noremap = true, silent = true, desc = "Debugger" })
vim.keymap.set(
    { "n", "v" },
    "<leader>jl",
    ":PioTermList<CR>",
    { noremap = true, silent = true, desc = "Terminal List" }
)
vim.keymap.set({ "n", "v" }, "<leader>jm", ":Piomon<CR>", { noremap = true, silent = true, desc = "Serial Monitor" })
vim.keymap.set({ "n", "v" }, "<leader>j", ":Pio<CR>", { noremap = true, silent = true, desc = "Refresh LSP Support?" })
-- vim.keymap.set({ "n", "v" }, "<leader>j", ":Pio<CR>", { noremap = true, silent = true, desc = "" })
