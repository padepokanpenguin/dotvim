local status, db = pcall(require, 'dashboard')
if (not status) then
  return
end

-- dashboard-nvim v2 configuration (see https://github.com/nvimdev/dashboard-nvim)
-- The ASCII banner is the original project art. The v1 config assigned it to
-- a misspelled option (`cusom_footer`) so it never rendered; it now fills the
-- v2 `header`. Its 30-column left margin is trimmed and every line is padded
-- to the same canvas width, because the dashboard centres each line on its
-- own and would otherwise misalign the art and the caption.
--
-- NOTE: the v1 built-in commands `SessionLoad` and `DashboardFindHistory` no
-- longer exist in v2; the actions below use the current equivalents.
db.setup({
  theme = 'doom',
  config = {
    header = {
      "",
      "                   ..                   ",
      "                 ..:^:.                 ",
      "               .:::::^^:.               ",
      "             .::::.  .:^^:.             ",
      "           .::::.      .:^^:.           ",
      "         .:::..          .:^^^.         ",
      "       .:::.       ....    .:^^^:       ",
      "     ..::.        :.:::..    .:^^^:     ",
      "   .::::         .:            .^^^^:.  ",
      "   .::::        .::   .:        ^^^^::. ",
      "    .:::       :^^^   .:.      .^^^^.   ",
      "    .:::      .^^^^   :::      .^^^^.   ",
      "    .:::      ^^^^.  :.        .^^^^.   ",
      "    .:::     .^::   .:..       .^^^^.   ",
      "    .:::                       .^^^^.   ",
      "    ....                        ::::.   ",
      "..................::....................",
      "                  ..::::::::::::::::::::",
      "",
      "",
      "        Stay Hungry, Stay Foolish       ",
      "",
      "",
    },
    center = {
      {
        icon = '  ',
        desc = 'Recently latest session',
        shortcut = '\\sl',
        action = function()
          require('persistence').load()
        end
      },
      {
        icon = '  ',
        desc = 'Recently opened files',
        action = 'Telescope oldfiles',
        shortcut = '\\sh'
      },
      {
        icon = '  ',
        desc = 'Find  File',
        action = 'Telescope find_files find_command=rg,--hidden,--files',
        shortcut = ';f'
      },
      {
        icon = '  ',
        desc = 'File Browser',
        action = 'Telescope file_browser',
        shortcut = 'sf'
      },
      {
        icon = '  ',
        desc = 'Find  word',
        action = 'Telescope live_grep',
        shortcut = ';r'
      },
    },
    footer = { 'PadepokanPenguin' },
  },
})