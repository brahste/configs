local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- All language servers installed at ~/.local/share/nvim/lsp_servers/
-- and symlinked to ~/.local/bin/
require'lspconfig'.clangd.setup{on_attach=on_attach, capabilities=capabilities}
require'lspconfig'.rust_analyzer.setup{
  on_attach=on_attach,
  capabilities=capabilities
}
-- require'lspconfig'.cmake.setup{capabilities=capabilities}
-- require'lspconfig'.dockerls.setup{capabilities=capabilities}
-- require'lspconfig'.pyright.setup{
--   capabilities=capabilities,
--   settings = {
--     python = {
--       analysis = {       
--         typeCheckingMode = "off",                                                                                          
--       }
--     }
--   }   
-- }

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = false
})
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
