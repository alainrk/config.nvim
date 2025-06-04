return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.5",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    require("telescope").setup({
      pickers = {
        -- Allows to search for hidden files not in git (e.g. .env files)
        find_files = {
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--smart-case",
            "--no-ignore-vcs",
            "-g",
            "!**/.git/*",
            "-g",
            "!**/.next/*",
            "-g",
            "!**/dist/*",
            "-g",
            "!**/node_modules/*",
            "-g",
            "!**/venv/*",
          },
        },
        -- Allows to search inside hidden files not in git (e.g. .env files)
        live_grep = {
          additional_args = {
            "--hidden",
            "--no-ignore-vcs",
            "-g",
            "!**/.git/*",
            "-g",
            "!**/node_modules/*",
            "-g",
            "!**/venv/*",
            "-g",
            "!**/dist/*",
            "-g",
            "!**/.next/*",
          },
        },
        grep_string = {
          additional_args = {
            "--hidden",
            "--no-ignore-vcs",
            "-g",
            "!**/.git/*",
            "-g",
            "!**/node_modules/*",
            "-g",
            "!**/venv/*",
            "-g",
            "!**/dist/*",
            "-g",
            "!**/.next/*",
          },
        },
      },
    })

    local builtin = require("telescope.builtin")

    -- Resume the previous search
    vim.keymap.set("n", "<leader>sx", require("telescope.builtin").resume, {
      noremap = true,
      silent = true,
      desc = "Resume previous search",
    })

    -- Call custom "multigrep" util to search in Telescope "thing_to search[  ]file_pattern" with "  " in between
    -- Use "search_pattern  */plugins/**" to search into subpath of folders, regardless the level from CWD
    vim.keymap.set("n", "<leader>sf", function()
      require("config.telescope.multigrep").multigrep()
    end, { desc = "Search pattern in files (use double space)" })

    -- Search the current word under cursor (not including special chars or anything)
    vim.keymap.set("n", "<leader>spw", function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)

    -- Search the current expression under cursor (e.g. conn.Close())
    vim.keymap.set("n", "<leader>spW", function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end, { desc = "Search the current expression under cursor" })

    -- Opens a prompt to search an exact match across the project
    vim.keymap.set("n", "<leader>sps", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, { desc = "Search an exact match across the project" })

    -- Opens a prompt to search in the help
    vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "Search in the help" })

    -- Search only non-git files (type :Telescope git_files to search for all, or leader+f+g)
    -- vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Search for files" })
  end,
}
