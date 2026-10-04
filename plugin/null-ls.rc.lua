-- none-ls.nvim is the maintained fork of null-ls.nvim (archived upstream).
-- Note: only the repository name changed, the Lua module is still `null-ls`.
-- It also replaces the former prettier.nvim setup.
--
-- Format on save is enabled by the BufWritePre autocmd at the bottom; the
-- formatters themselves come from Mason (see after/plugin/mason.rc.lua).
local status, null_ls = pcall(require, "null-ls")
if (not status) then
  return
end

-- none-ls ships no `ruff` builtin yet, so declare one using ruff's formatter.
-- See https://docs.astral.sh/ruff/ and :help null-ls-custom-sources
local ruff_format = require("null-ls.helpers").make_builtin({
  name = "ruff_format",
  meta = {
    url = "https://docs.astral.sh/ruff/formatter/",
    description = "An extremely fast Python formatter, written in Rust.",
  },
  method = require("null-ls.methods").internal.FORMATTING,
  filetypes = { "python" },
  generator_opts = {
    command = "ruff",
    args = { "format", "--stdin-filename", "$FILENAME", "-" },
    to_stdin = true,
  },
  factory = require("null-ls.helpers").formatter_factory,
})

null_ls.setup({
  sources = {
    -- web
    null_ls.builtins.formatting.prettierd.with({
      filetypes = {
        'css',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'json',
        'scss',
        'less',
      },
    }),
    -- Go
    null_ls.builtins.formatting.gofumpt.with({ filetypes = { 'go' } }),
    -- Python
    ruff_format,
    -- C# (.NET)
    null_ls.builtins.formatting.csharpier.with({ filetypes = { 'cs', 'csproj' } }),
  },
})

-- Format the buffer before writing, but only when a formatter is attached.
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("UserFormatOnSave", { clear = true }),
  callback = function(args)
    vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 3000 })
  end,
})
