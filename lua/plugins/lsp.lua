return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      -- Python
      vim.lsp.config("pyright", {
        settings = {
          pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { "*" },
            },
          },
        },
      })

      vim.lsp.config("ruff", {
        init_options = {
          settings = {
            configurationPreference = "filesystemFirst",
            fixAll = true,
            organizeImports = true,
            lint = {
              enable = true,
              preview = true,
            },
            format = {
              preview = true,
            },
          },
        },
      })

      -- Defer hover in favor of Pyright
      -- vim.api.nvim_create_autocmd("LspAttach", {
      --   group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
      --   callback = function(args)
      --     local client = vim.lsp.get_client_by_id(args.data.client_id)
      --     if client == nil then
      --       return
      --     end
      --     if client.name == "ruff" then
      --       -- Disable hover in favor of Pyright
      --       client.server_capabilities.hoverProvider = false
      --     end
      --   end,
      --   desc = "LSP: Disable hover capability from Ruff",
      -- })

      vim.lsp.enable("ruff")

      -- Keymaps
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "gh", vim.lsp.buf.hover }
    end,

    opts = {
      -- autoformat = true,
      inlay_hints = { enabled = false },
      setup = {
        -- Fix LSP Timeout because of eslint: https://www.reddit.com/r/neovim/comments/1f44u1a/eslint_performance_compared_to_vscode_lspeslint/
        eslint = function() end,
        -- C/Cpp
        clangd = function(_, opts)
          local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
          require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
          return false
        end,
      },
      servers = {
        eslint = {},
        gopls = {},
        jsonls = {},
        clangd = {
          keys = {
            { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "Makefile",
              "configure.ac",
              "configure.in",
              "config.h.in",
              "meson.build",
              "meson_options.txt",
              "build.ninja"
            )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
              fname
            ) or require("lspconfig.util").find_git_ancestor(fname)
          end,
          capabilities = {
            offsetEncoding = { "utf-16" },
          },
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim", "hs" }, -- hs is for Hammerspoon
              },
            },
          },
        },
        -- Setting it up in init, above
        -- pyright = {},
        terraformls = {},
        -- Needed for typescript-tools: https://github.com/pmizio/typescript-tools.nvim
        tsserver = {
          maxTsServerMemory = 8192, -- https://www.reddit.com/r/neovim/comments/1hxcs1q/lsp_keeps_crashingrestarting_jsts/
        },
        yamlls = {},
      },
    },
  },
}
