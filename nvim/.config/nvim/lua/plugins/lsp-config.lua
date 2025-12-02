return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {}, -- mason can be set up via opts with lazy.nvim
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      -- old `auto_install = true` → use ensure_installed
      ensure_installed = { "tailwindcss", "ruby_lsp", "lua_ls" },
      -- we'll define our own configs below, so don't auto-enable
      automatic_enable = false,
    },
    dependencies = { "neovim/nvim-lspconfig" },
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- capabilities (same as you had)
      local capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      )

      -- define each server (vim.lsp.config) then start it (vim.lsp.enable)
      vim.lsp.config("tailwindcss", { capabilities = capabilities })
      vim.lsp.enable("tailwindcss")

      vim.lsp.config("ruby_lsp", { capabilities = capabilities })
      vim.lsp.enable("ruby_lsp")

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })
      vim.lsp.enable("lua_ls")

      -- your keymaps (unchanged)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
    end,
  },
}
