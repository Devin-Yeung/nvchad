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
      local cmp = require "cmp"
      -- I prefer not to select the first one (noselect)
      -- see https://github.com/hrsh7th/nvim-cmp/discussions/1411#discussioncomment-4755441
      opts.preselect = cmp.PreselectMode.None
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
}
