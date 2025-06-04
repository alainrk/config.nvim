return {
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      -- Disable this as I need it for lint
      { "<leader>gl", mode = { "n", "x", "o" }, false },
    },
  },
  {
    "f-person/git-blame.nvim",
    config = function()
      vim.g.gitblame_date_format = "%d/%m/%y"
      vim.g.gitblame_enabled = 0

      vim.keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { desc = "Toggle git blame" })
    end,
  },
}
