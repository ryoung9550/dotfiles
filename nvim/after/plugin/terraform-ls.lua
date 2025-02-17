lspconfig = require 'lspconfig'
lspconfig.terraformls.setup {
  --filetypes = { 'terraform', 'tf' },
  settings = {
    terraform = {
      completion = {
        enabled = true,
        triggerCharacters = { '.', '$', '[' },
      },
      downloadSchema = true,
    },
  },
}
