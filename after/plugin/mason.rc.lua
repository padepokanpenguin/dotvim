local status, mason = pcall(require, "mason")
if (not status) then
    return
end
local status2, mason_lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then
    return
end

mason.setup({})

-- mason-lspconfig v2 API: it installs the servers listed below and enables the
-- installed ones automatically via vim.lsp.enable().
-- See :help mason-lspconfig-settings
mason_lspconfig.setup {
    ensure_installed = {
        "lua_ls",
        "ts_ls",
        "tailwindcss",
        "typos_lsp",
        "snyk_ls",
    },
}
