local no_remap_silent = { noremap=true, silent=true }
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.cmd("set completeopt=menu,menuone,noselect")
  local keymap = vim.keymap;
  local buf = vim.lsp.buf;

  keymap.set('n', 'gd', buf.definition, no_remap_silent)
  keymap.set('n', 'gD', buf.declaration, no_remap_silent)
  keymap.set('n', 'gt', buf.type_definition, no_remap_silent)
  keymap.set('n', 'gr', buf.references, no_remap_silent)
  keymap.set('n', 'gR', buf.rename, no_remap_silent)
  keymap.set('n', 'gi', buf.implementation, no_remap_silent)
  keymap.set('n', 'ga', buf.code_action, no_remap_silent)
  keymap.set('n', 'gk', buf.hover, no_remap_silent)
  keymap.set('v', 'ga', buf.range_code_action, no_remap_silent)

  keymap.set('n', 'ge', vim.diagnostic.open_float, no_remap_silent)
  keymap.set('n', 'gn', vim.diagnostic.goto_next, no_remap_silent)
  keymap.set('n', 'gp', vim.diagnostic.goto_prev, no_remap_silent)
  keymap.set('n', '<leader>d', vim.diagnostic.setloclist, no_remap_silent)
end

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

local lspconfig = require('lspconfig')
lspconfig.gopls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.rust_analyzer.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.dartls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.sumneko_lua.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.clangd.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--resource-dir=/opt/bb/lib/llvm-12.0/lib64/clang/12.0.1/"
  }
}
