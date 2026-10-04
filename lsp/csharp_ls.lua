-- C# language server (csharp-ls, Roslyn based).
-- Installed through Mason (NuGet package); requires the .NET SDK on the system.
-- The server picks up .csproj / .sln files in the workspace automatically.
return {
  init_options = {
    -- build the workspace as soon as a project file is found
    automaticWorkspaceInit = true,
  },
}
