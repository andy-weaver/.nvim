return {
  -- Completion framework
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP completion source
      "hrsh7th/cmp-buffer", -- Buffer completion
      "hrsh7th/cmp-path", -- Path completion
      "hrsh7th/cmp-cmdline", -- Command-line completion
      "L3MON4D3/LuaSnip", -- Snippet engine (optional, but recommended)
      "hrsh7th/cmp-emoji",
    },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig", -- Quickstart configurations for the LSP
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("lspconfig").tsserver.setup({ capabilities = capabilities })
      require("lspconfig").ruff.setup({ capabilities = capabilities })
      require("lspconfig").rust_analyzer.setup({ capabilities = capabilities })
      require("lspconfig").clippy.setup({ capabilities = capabilities })
    end,
  },
}

