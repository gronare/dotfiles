return {
  -- UI Select support for better vim.ui integration
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },

  -- FZF native sorter integration (requires `make`)
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
  },

  -- Main Telescope plugin
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,

          -- layout tweaks for better UX
          layout_config = {
            prompt_position = "bottom",
          },
          sorting_strategy = "descending",
          path_display = { "truncate" },
        },

        pickers = {
          find_files = {
            hidden = true,
            theme = "ivy",
            previewer = false, -- faster and avoids UI glitches
          },
          buffers = {
            theme = "ivy",
            previewer = false,
          },
        },

        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          fzf = {
            fuzzy = true, -- enable fuzzy matching
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })

      -- Load extensions
      telescope.load_extension("ui-select")
      telescope.load_extension("fzf")

      -- Keybindings
      local builtin = require("telescope.builtin")
      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }

      keymap("n", "<C-p>", builtin.find_files, { desc = "Telescope find files" })
      keymap("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      keymap("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
      keymap("n", "<leader><leader>", builtin.oldfiles, { desc = "Telescope old files" })
      keymap("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
      keymap("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    end,
  },
}
