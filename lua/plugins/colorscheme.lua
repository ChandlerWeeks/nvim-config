return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
          telescope = true,
          native_lsp = { enabled = true },
          treesitter = true,
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
