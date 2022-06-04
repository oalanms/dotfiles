vim.keymap.set('n', 'gd', '<Plug>(coc-definition)')
vim.keymap.set('n', 'gD', '<Plug>(coc-declaration)')
vim.keymap.set('n', 'gt', '<Plug>(coc-type-definition)')
vim.keymap.set('n', 'gr', '<Plug>(coc-references)')
vim.keymap.set('n', 'gR', '<Plug>(coc-rename)')
vim.keymap.set('n', 'gn', '<Plug>(coc-diagnostic-next)')
vim.keymap.set('n', 'gp', '<Plug>(coc-diagnostic-prev)')
vim.keymap.set('n', 'gb', ':bp<CR>')
vim.keymap.set('n', 'gA', ':call CocAction("codeAction")<CR>')

