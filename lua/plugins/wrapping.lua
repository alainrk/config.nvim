return {
  "andrewferrier/wrapping.nvim",
  config = function()
    local w = require("wrapping")
    w.setup()
    w.soft_wrap_mode()

    -- Commands available:
    --
    -- HardWrapMode
    -- SoftWrapMode
    -- ToggleWrapMode
    -- As well as the following normal-mode keymappings:
    --
    -- [ow (soft wrap mode)
    -- ]ow (hard wrap mode)
    -- yow (toggle wrap mode)
  end,
}
