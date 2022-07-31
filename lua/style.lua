vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.colorcolumn = 80
vim.o.mouse = true

vim.cmd('colorscheme codedark')

vim.cmd([[
highlight WinSeparator guibg=None
]])

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"dart"},
    callback = function()
        vim.o.shiftwidth = 2
        vim.o.tabstop = 2
    end
})

require('nvim-treesitter.configs').setup {
    ensure_installed = { "c", "cpp", "lua", "go", "dart", "python" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
}
