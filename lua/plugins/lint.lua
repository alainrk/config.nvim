-- NOTE: This is just disabled for now, I wanted to test a few things as mentioned
-- in this video about lint/format: https://www.youtube.com/watch?v=y1WWOaLCNyI
-- XXX: Also note that this requires to go to :Mason and install the appropriate linters
-- return {
--   "mfussenegger/nvim-lint",
--   enabled = false,
--   event = { "BufReadPre", "BufNewFile" },
--   config = function()
--     local lint = require("lint")
--     lint.linters_by_ft = {
--       javascript = { "eslint_d" },
--       javascriptreact = { "eslint_d" },
--       python = { "flake8" },
--       svelte = { "eslint_d" },
--       terraform = { "tflint" },
--       typescript = { "eslint_d" },
--       typescriptreact = { "eslint_d" },
--       go = { "golangcilint" },
--       yaml = { "yamllint" },
--       zsh = { "shellcheck" },
--       sh = { "shellcheck" },
--       json = { "jsonlint" },
--       jsonc = { "jsonlint" },
--       -- graphql = { "gqlint" },
--       -- graphqls = { "gqlint" },
--     }
--
--     local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
--     vim.api.nvim_create_autocmd({ "BufEnter", "BufwritePost", "InsertLeave" }, {
--       group = lint_augroup,
--       callback = function()
--         lint.try_lint()
--       end,
--     })
--
--     vim.keymap.set("n", "<leader>gl", function()
--       lint.try_lint()
--     end, { desc = "Trigger linting for current file" })
--   end,
-- }

return {
  "mfussenegger/nvim-lint",
  enabled = false,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Helper function to check if Biome config exists in project root
    local function has_biome_config()
      -- Check for biome.json in current or parent directories
      local root = vim.fn.findfile("biome.json", ".;")
      return root ~= ""
    end

    -- Configure linters conditionally based on project
    lint.linters_by_ft = {
      javascript = function()
        return has_biome_config() and { "biomejs" } or { "eslint_d" }
      end,
      typescript = function()
        return has_biome_config() and { "biomejs" } or { "eslint_d" }
      end,
      javascriptreact = function()
        return has_biome_config() and { "biomejs" } or { "eslint_d" }
      end,
      typescriptreact = function()
        return has_biome_config() and { "biomejs" } or { "eslint_d" }
      end,
      -- Keep other linters as is
      python = { "flake8" },
      terraform = { "tflint" },
      go = { "golangcilint" },
      yaml = { "yamllint" },
      zsh = { "shellcheck" },
      sh = { "shellcheck" },
      json = { "jsonlint" },
      jsonc = { "jsonlint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufwritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>gl", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
