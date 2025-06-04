return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = function(_, opts)
    opts.incremental_selection = {
      enable = true,
      -- NOTE: Temporarily disable to see if after Lazy update it improved in performance
      -- disable = { "markdown" },
      keymaps = {
        init_selection = "<leader>vs",
        node_incremental = "<leader>vn",
        scope_incremental = "<leader>vs",
        node_decremental = "<leader>vd",
      },
    }

    vim.list_extend(opts.ensure_installed, {
      "awk",
      "bash",
      -- "c", -- Included in cpp
      "cpp",
      "comment",
      "css",
      "csv",
      "dockerfile",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "gleam",
      "go",
      "gomod",
      "gosum",
      "gotmpl",
      "gowork",
      "gpg",
      "graphql",
      "hcl",
      "helm",
      "html",
      "http",
      "ini",
      "javascript",
      "jq",
      "jsdoc",
      "json",
      "json5",
      "jsonc",
      "lua",
      "luadoc",
      "make",
      "markdown",
      "markdown_inline",
      "python",
      "regex",
      "rego",
      "rust",
      "scheme",
      "sql",
      "ssh_config",
      "svelte",
      "tcl",
      "terraform",
      "typescript",
      "vim",
      "vimdoc",
      "vue",
      "xml",
      "yaml",
      "zig",
    })
  end,

  config = function(_, opts)
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    -- Prefer git instead of curl in order to improve connectivity in some environments
    require("nvim-treesitter.install").prefer_git = true
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup(opts)

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}
