return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp", -- Completion integration
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright", -- Python
        "ruff", -- Python linter
        "jsonls", -- JSON
        "html", -- HTML
        "rust_analyzer", -- Rust
        "cssls", -- CSS
        "yamlls", -- YAML
      },
      automatic_installation = true, -- Auto-install if missing
    })

    local lspconfig = require("lspconfig")

    -- Shared `on_attach` function
    local on_attach = function(client, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    end

    -- Default capabilities (LazyVim already includes cmp_nvim_lsp)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Setup all LSPs in `ensure_installed` automatically
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
    })
  end,
}
