return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "neovim-treesitter/treesitter-parser-registry" },
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")

      if not vim.list_contains(treesitter.get_installed("parsers"), "rust") then
        treesitter.install({ "rust" }):wait(300000)
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "rust",
        callback = function()
          local ok, err = pcall(vim.treesitter.start)
          if not ok then
            vim.notify("Unable to start Rust Treesitter: " .. err, vim.log.levels.WARN)
          end
        end,
      })
    end,
  },
}
