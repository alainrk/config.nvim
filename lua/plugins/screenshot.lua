return {
  "mistricky/codesnap.nvim",
  build = "make",
  config = function()
    require("codesnap").setup({
      save_path = "~/Desktop",
      -- has_breadcrumbs = true,
      bg_theme = "sea",
      bg_padding = 10,
    })
  end,
}
