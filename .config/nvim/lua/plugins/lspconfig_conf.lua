--- CONFIG FOR LSP
local nvim_lsp = require('lspconfig')

-- Mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
nmap('<localleader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
nmap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
nmap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
nmap('<localleader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_n('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  buf_n('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  buf_n('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  buf_n('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  -- buf_n('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  buf_n('<localleader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
  buf_n('<localleader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
  buf_n('<localleader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
  buf_n('<localleader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  buf_n('<localleader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  buf_n('<localleader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  buf_n('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  buf_n('<localleader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')

  -- don't show inline diagnostic message
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
  )

  -- custom icons for diagnosis msg
  local signs = {
      Error = " ",
      Warn = " ",
      Hint = " ",
      Info = " "
  }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
  end

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {'pyright', 'sumneko_lua'} 
for _, lsp in pairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end
