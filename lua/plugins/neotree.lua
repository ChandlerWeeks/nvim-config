return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    event = "VimEnter",
    opts = {},
    config = function(_, opts)
      require("neo-tree").setup(opts)
      vim.schedule(function()
        require("neo-tree.command").execute({
          action = "show",
          source = "filesystem",
          position = "left",
        })
      end)
    end,
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

      vim.api.nvim_create_user_command("ToggleTreeFocus", function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd("wincmd p")
          return
        end

        vim.cmd("FocusTree")
      end, { desc = "Toggle focus between file explorer and editor" })
    end,
    keys = {
      { "<leader>e", "<cmd>ToggleTreeFocus<cr>", desc = "Toggle file explorer focus" },
    },
  },
}
