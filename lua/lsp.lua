local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.cmd("set completeopt=menu,menuone,noselect")

  local opts = { noremap=true, silent=true }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gR', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
  vim.keymap.set('v', 'ga', vim.lsp.buf.range_code_action, opts)

  -- vim.keymap.set('n', '<leader><leader>', vim.lsp.buf.formatting, opts)
  vim.keymap.set('n', 'ge', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', 'gn', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', 'gp', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist, opts)
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"dart"}, 
	callback = function()
	vim.keymap.set('n', '<F4>', ':FlutterDevices<CR>')
	vim.keymap.set('n', '<F5>', ':FlutterRun<CR>')
	vim.keymap.set('n', '<F6>', ':FlutterVSplit<CR>')
	vim.keymap.set('n', '<F7>', ':FlutterHotRestart<CR>')
	vim.keymap.set('n', '<F8>', ':FlutterQuit<CR>')
	end
	})

local cmp = require('cmp')
cmp.setup({
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    })
})

 -- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.gopls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

require'lspconfig'.rust_analyzer.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

require'lspconfig'.dartls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Old coc.nvim stuff
-- vim.keymap.set('n', 'gd', '<Plug>(coc-definition)')
-- vim.keymap.set('n', 'gD', '<Plug>(coc-declaration)')
-- vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)')
-- vim.keymap.set('n', 'gt', '<Plug>(coc-type-definition)')
-- vim.keymap.set('n', 'gr', '<Plug>(coc-references)')
-- vim.keymap.set('n', 'gR', '<Plug>(coc-rename)')
-- vim.keymap.set('n', 'gn', '<Plug>(coc-diagnostic-next)')
-- vim.keymap.set('n', 'gp', '<Plug>(coc-diagnostic-prev)')
-- vim.keymap.set('n', 'gb', ':bp<CR>')
-- vim.keymap.set('n', 'gA', ':call CocAction("codeAction")<CR>')
-- vim.keymap.set('n', 'gs', ':CocList symbols<CR>')
-- 
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = {"dart"}, 
-- 	callback = function()
-- 	vim.keymap.set('n', '<F4>', ':CocCommand flutter.devices<CR>')
-- 	vim.keymap.set('n', '<F5>', ':CocCommand flutter.run<CR>')
-- 	vim.keymap.set('n', '<F6>', ':CocCommand flutter.dev.openDevLog<CR>')
-- 	vim.keymap.set('n', '<F7>', ':CocCommand flutter.dev.hotRestart<CR>')
-- 	vim.keymap.set('n', '<F8>', ':CocCommand flutter.dev.quit<CR>')
-- 	end
-- 	})

