return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jedi_language_server = false,
        pyright = {
          settings = {
            python = {
              venvPath = ".",
              pythonPath = "./.venv/bin/python",
            },
          },
        },
        ruff = {
          init_options = {
            -- FIXME: not working
            settings = {
              organizeImports = true, -- включает autoimport при save -- Don't work yet
            },
          },
          capabilities = {
            general = {
              -- positionEncodings = { "utf-8", "utf-16", "utf-32" }  <--- this is the default
              positionEncodings = { "utf-16" },
            },
          },
        },
      },
      vim.lsp.enable("cspell_ls"),
      vim.lsp.config("cspell_ls", {
        cmd = { "cspell-lsp", "--stdio" },
        filetypes = {
          "lua",
          "python",
          "rust",
          "go",
          "javascript",
          "typescript",
          "html",
          "css",
          "json",
          "yaml",
          "markdown",
          "gitcommit",
        },
        root_markers = { ".git" },
      }),
    },
  },
}
