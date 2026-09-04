return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "neovim-treesitter/treesitter-parser-registry" },
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")

      local parsers = treesitter.get_installed("parsers")
      local missing_parsers = vim.tbl_filter(function(parser)
        return not vim.list_contains(parsers, parser)
      end, { "python", "rust" })
      if #missing_parsers > 0 then
        treesitter.install(missing_parsers):wait(300000)
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "python", "rust" },
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
