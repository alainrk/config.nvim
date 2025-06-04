return {
  "brenton-leighton/multiple-cursors.nvim",
  version = "*", -- Use the latest tagged version
  opts = {
    custom_key_maps = {
      -- Custom key maps for additional multicuror functions
      {
        "n",
        "<C-3>",
        function()
          require("multiple-cursors").align()
        end,
        desc = "Align multiple cursors",
      },
      -- Enable commenting single and multiple
      {
        { "n", "i" },
        "<C-/>",
        function()
          vim.cmd("normal gcc")
        end,
      },
      {
        "v",
        "<C-/>",
        function()
          vim.cmd("normal gc")
        end,
      },
    },
  }, -- This causes the plugin setup function to be called
  keys = {
    { "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move up" },
    { "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move down" },

    { "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" }, desc = "Add or remove cursor" },
    {
      "<C-1>",
      "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
      mode = { "n", "i" },
      desc = "Add cursor at the current match and go to the next",
    },
    {
      "<C-2>",
      "<Cmd>MultipleCursorsJumpNextMatch<CR>",
      mode = { "n", "i" },
      desc = "Move real cursor at current match without adding multicursor",
    },
  },
}
