-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "lua_ls", "clangd", "rust_analyzer", "pyright" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      -- https://github.com/mrcjkb/rustaceanvim/discussions/46#discussioncomment-7636177
      vim.lsp.inlay_hint.enable(true)
      nvlsp.on_attach(client, bufnr)
    end,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.ocamllsp.setup {
  on_attach = function(client, bufnr)
    -- https://github.com/mrcjkb/rustaceanvim/discussions/46#discussioncomment-7636177
    vim.lsp.inlay_hint.enable(true)
    nvlsp.on_attach(client, bufnr)
  end,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  -- See: https://github.com/ocaml/ocaml-lsp/blob/master/ocaml-lsp-server/docs/ocamllsp/config.md
  settings = {
    inlayHints = {
      enable = true,
    },
    codelens = {
      enable = true,
    },
  },
}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
