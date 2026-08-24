return {
  {
    "amitds1997/remote-nvim.nvim",
    version = "v0.3.12",
    enabled = not vim.g.remote_neovim_host,
    cmd = {
      "RemoteStart",
      "RemoteStop",
      "RemoteInfo",
      "RemoteCleanup",
      "RemoteConfigDel",
      "RemoteLog",
    },
    keys = {
      { "<leader>rs", "<cmd>RemoteStart<cr>", desc = "Start remote Neovim" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {},
  },
}
