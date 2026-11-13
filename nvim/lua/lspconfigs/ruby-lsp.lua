--require('lspconfig').ruby_lsp.setup {}
require('lspconfig').solargraph.setup {
  settings = {
    solargraph = {
      autoformat = { enabled = false },
    },
  },
  init_options = { formatting = false },
}
