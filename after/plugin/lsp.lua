local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'lua_ls','gradle_ls', 'groovyls', 'jdtls', 'jsonls', 'tsserver', 'html', 'cssls', 'dockerls', 'docker_compose_language_service', 'rubocop','lemminx', 'yamlls', 'bashls'},
  handlers = {
    lsp_zero.default_setup,
  },
})
