return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    opts = {},
    init = function()
      vim.api.nvim_create_user_command("FocusTree", function()
        local file = vim.api.nvim_buf_get_name(0)
        require("neo-tree.command").execute({
          action = "focus",
          source = "filesystem",
          position = "left",
          reveal_file = file ~= "" and file or vim.fn.getcwd(),
          reveal_force_cwd = true,
        })
      end, { desc = "Focus file explorer" })
    end,
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
      { "<leader>ef", "<cmd>FocusTree<cr>", desc = "Focus file explorer" },
    },
  },
}
