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
        -- web / general
        "lua_ls",
        "ts_ls",
        "tailwindcss",
        "typos_lsp",
        "snyk_ls",
        -- C# (.NET), Go, Python
        "csharp_ls",
        "gopls",
        "basedpyright",
    },
    -- snyk_ls refuses to work without an authenticated Snyk account and only
    -- logs "Auth initializer failed to authenticate" otherwise, so it is not
    -- started automatically. It is enabled in plugin/lsp.rc.lua when SNYK_TOKEN
    -- is present in the environment.
    automatic_enable = {
        exclude = { "snyk_ls" },
    },
}

-- Tools that are not language servers (formatters/linters) are managed
-- separately by mason-tool-installer.
-- See https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
local status3, installer = pcall(require, "mason-tool-installer")
if (not status3) then
    return
end

installer.setup {
    ensure_installed = {
        "gofumpt", -- Go formatter
        "ruff", -- Python formatter/linter
        "csharpier", -- C# formatter
        "semgrep", -- security: static analysis (SAST)
        "gitleaks", -- security: hardcoded secrets
    },
    run_on_start = true,
}
