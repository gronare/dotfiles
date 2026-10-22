return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Show hidden or filtered files
      },
    },
  },
  keys = {
    -- Define key mappings
    { "<C-n>", ":Neotree filesystem reveal toggle left<CR>", desc = "Toggle Neo-tree (filesystem)" },
    { "<leader>bf", ":Neotree buffers reveal toggle float<CR>", desc = "Toggle Neo-tree (buffers)" },
  },
}
