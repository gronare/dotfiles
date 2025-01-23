return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  keys = {
    { "<leader>t", ":TestNearest<CR>", desc = "Run Nearest Test" },
    { "<leader>T", ":TestFile<CR>", desc = "Run Test File" },
    { "<leader>a", ":TestSuite<CR>", desc = "Run Test Suite" },
    { "<leader>l", ":TestLast<CR>", desc = "Run Last Test" },
    { "<leader>g", ":TestVisit<CR>", desc = "Visit Last Test File" },
  },
  config = function()
    vim.g["test#strategy"] = "vimux" -- Set the test execution strategy
  end,
}
