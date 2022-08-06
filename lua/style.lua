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

local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
end

hl("SignColumn", {
    bg = "none",
})

hl("ColorColumn", {
    ctermbg = 0,
    bg = "#555555",
})

hl("CursorLineNR", {
    bg = "None"
})

hl("Normal", {
    bg = "none"
})

hl("LineNr", {
    fg = "#5eacd3"
})

hl("netrwDir", {
    fg = "#5eacd3"
})

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "dart" },
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
