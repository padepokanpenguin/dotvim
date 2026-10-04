-- Python type checker / language server.
-- basedpyright is the maintained fork of pyright (see
-- https://docs.basedpyright.com/), installed through Mason (PyPI).
return {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = 'standard',
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
      },
    },
  },
}
