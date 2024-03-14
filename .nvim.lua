local _lspconfig_loaded, _lspconfig = pcall(require, "lspconfig")
local _lspformat_loaded, _lspformat = pcall(require, "lsp-format")

if _lspconfig_loaded and _lspformat_loaded then
  _lspconfig.nil_ls.setup({
    on_attach = _lspformat.on_attach,
    settings = {
      ["nil"] = {
        formatting = {
          command = { "nixpkgs-fmt" }
        }
      }
    }
  })
end
