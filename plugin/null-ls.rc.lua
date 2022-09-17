local status, null_ls = pcall(require, "null-ls")
if (not status) then
    return
end
local augroup_format = vim.api.nvim_create_augroup("Format", {
    clear = true
})
null_ls.setup({
    sources = {null_ls.builtins.diagnostics.eslint_d.with({
        diagnostics_format = '[eslint] #{m}\n(#{c})',
        -- ignore prettier warnings from eslint-plugin-prettier
        filter = function(diagnostic)
            return diagnostic.code ~= "prettier/prettier"
        end
    }), null_ls.builtins.formatting.prettier, null_ls.builtins.diagnostics.write_good,
               null_ls.builtins.code_actions.gitsigns, null_ls.builtins.diagnostics.fish},
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_clear_autocmds {
                buffer = 0,
                group = augroup_format
            }
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup_format,
                buffer = 0,
                callback = function()
                    vim.lsp.buf.formatting_seq_sync()
                end
            })
        end
    end
})
-- require("null-ls").setup({
--     sources = {require("null-ls").builtins.formatting.stylua, require("null-ls").builtins.diagnostics.eslint,
--                require("null-ls").builtins.completion.spell}
-- })
