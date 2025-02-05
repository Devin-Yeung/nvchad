return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local opts = require "nvchad.configs.cmp"
      -- I prefer not to select the first one (noselect)
      opts.completion.completeopt = "menu,menuone,noselect"
      return opts
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "nix",
        "json",
        "toml",
        "rust",
      },
    },
  },

  -- inlay hints
  {
    "lvimuser/lsp-inlayhints.nvim",
    init = function()
      -- https://github.com/mrcjkb/rustaceanvim/discussions/46#discussioncomment-7636177
      require("lsp-inlayhints").setup()
      -- override the InlayHint color with onedark bg
      vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "", bg = "#1e222a" })
      -- toggle
      require("lsp-inlayhints").toggle()
    end,
  },
}
