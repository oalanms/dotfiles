local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.cmd("set completeopt=menu,menuone,noselect")

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, no_remap_silent)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, no_remap_silent)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, no_remap_silent)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, no_remap_silent)
  vim.keymap.set('n', 'gR', vim.lsp.buf.rename, no_remap_silent)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, no_remap_silent)
  vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, no_remap_silent)
  vim.keymap.set('v', 'ga', vim.lsp.buf.range_code_action, no_remap_silent)

  vim.keymap.set('n', 'ge', vim.diagnostic.open_float, no_remap_silent)
  vim.keymap.set('n', 'gn', vim.diagnostic.goto_next, no_remap_silent)
  vim.keymap.set('n', 'gp', vim.diagnostic.goto_prev, no_remap_silent)
  vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist, no_remap_silent)
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
    }),
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
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

require'lspconfig'.clangd.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--resource-dir=/opt/bb/lib/llvm-12.0/lib64/clang/12.0.1/"
  }
}
