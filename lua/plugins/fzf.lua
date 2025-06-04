return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")
    local actions = fzf.actions

    -- Basic resume (Esc/Ctrl-C) only restores query/params - Set this as default for full resume including cursor/selection
    fzf.setup({
      keymap = { builtin = { true, ["<Esc>"] = "hide" } },
    })
  end,
}
