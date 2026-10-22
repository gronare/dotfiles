return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- Filetype detection for .html.slim files
      vim.filetype.add({
        extension = {
          slim = "slim",
          html_slim = "slim", -- Ensures .html.slim files are treated as Slim
        },
      })

      -- Treesitter setup
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = { "ruby", "javascript", "typescript", "html", "css", "scss", "json", "lua" },
      })
    end
  }
}
