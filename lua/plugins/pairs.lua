return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local autopairs = require("nvim-autopairs")

      autopairs.setup()

      -- Keep Rust lifetimes such as `'a` and string delimiters under explicit
      -- control while still pairing the structural delimiters (), [], and {}.
      autopairs.remove_rule("'")
      autopairs.remove_rule('"')
      autopairs.remove_rule("`")
    end,
  },
}
