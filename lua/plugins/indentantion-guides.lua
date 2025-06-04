return {
  "lukas-reineke/indent-blankline.nvim",
  event = "LazyFile",
  opts = function()
    return {
      indent = {
        char = "│",
        tab_char = "│",
      },
      whitespace = {
        remove_blankline_trail = false,
      },
      scope = { show_start = false, show_end = false, enabled = false },
      exclude = {
        filetypes = {
          "Trouble",
          "alpha",
          "dashboard",
          "help",
          "lazy",
          "mason",
          "neo-tree",
          "notify",
          "snacks_dashboard",
          "snacks_notif",
          "snacks_terminal",
          "snacks_win",
          "toggleterm",
          "trouble",
        },
      },
    }
  end,
  main = "ibl",
}
