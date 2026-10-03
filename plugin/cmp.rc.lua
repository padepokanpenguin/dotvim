local status, cmp = pcall(require, 'cmp')
if (not status) then return end

local lspkind = require 'lspkind'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' }
    }),
    formatting = {
        fields = { 'abbr', 'icon', 'kind', 'menu' },
        -- Current lspkind.nvim API: see https://github.com/onsails/lspkind.nvim
        format = lspkind.cmp_format({
            maxwidth = {
                menu = 50, -- leading text (labelDetails)
                abbr = 50, -- actual suggestion item
            },
            ellipsis_char = '...',
            show_labelDetails = true,
        }),
    }
})


vim.cmd [[
    set completeopt=menuone,noinsert,noselect
    highlight! default link CmpItemKind CmpItemMenuDefault
]]
