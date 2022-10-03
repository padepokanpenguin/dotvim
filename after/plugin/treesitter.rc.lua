local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

--ts.setup {
--  highlight = {
--    enable = true,
-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
-- Using this option may slow down your editor, and you may see some duplicate highlights.
-- Instead of true it can also be a list of languages
--    additional_vim_regex_highlighting = false,
--  },
--}

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  --  ensure_installed = {
  --    "tsx",
  --    "php",
  --    "json",
  --    "yaml",
  --    "css",
  --    "html",
  --    "lua"
  --  },
  autotag = {
    enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
