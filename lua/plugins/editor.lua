return {
  {
    "nvim-telescope/telescope.nvim",
    version = "v0.2.1",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find in current file" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find text" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help" },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
