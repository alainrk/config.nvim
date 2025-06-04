-- return {
--   "Exafunction/codeium.vim",
--   event = "BufEnter",
--   config = function(_, opts)
--     -- vim.g.codeium_disable_bindings = 1
--     vim.g.codeium_no_map_tab = true
--
--     vim.keymap.set("i", "<C-l>", vim.fn["codeium#Accept"], { expr = true })
--   end,
-- }

-- New implementation, seems to work better
return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup()
    vim.keymap.set("i", "<C-l>", neocodeium.accept)
    vim.keymap.set("i", "<A-n>", neocodeium.cycle_or_complete)
  end,
}
