-- nvim-treesitter on the `main` branch (full rewrite, Neovim 0.12+).
-- Reference: https://github.com/nvim-treesitter/nvim-treesitter
--
-- The plugin now only manages parsers/queries; highlighting and indentation
-- are provided by Neovim itself and must be started per buffer.

local status, ts = pcall(require, "nvim-treesitter")
if (not status) then return end

ts.setup {}

-- Parsers to keep installed. install() is a no-op for parsers already present.
ts.install {
  "tsx",
  "php",
  "json",
  "css",
  "html",
  "lua",
}

-- Enable treesitter highlighting (and experimental treesitter indentation)
-- for every buffer whose filetype has a parser available.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
  callback = function(args)
    if not pcall(vim.treesitter.start, args.buf) then
      return -- no parser for this filetype
    end

    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
