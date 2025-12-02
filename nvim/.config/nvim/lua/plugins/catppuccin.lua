return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,

    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          telescope = true,
          treesitter = true,
          lsp_trouble = true,
          lsp_saga = true,
          nvimtree = true,
          notify = true,
          which_key = true,
        },
      })
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  }
}
