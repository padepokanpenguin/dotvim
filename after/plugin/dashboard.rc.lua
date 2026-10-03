local status, db = pcall(require, 'dashboard')
if (not status) then
  return
end

-- dashboard-nvim v2 configuration (see https://github.com/nvimdev/dashboard-nvim)
-- The ASCII banner is the original project art (restored, not the image
-- conversion). In the v1 config it was assigned to a misspelled option
-- (`cusom_footer`) and therefore never rendered; it now fills the v2
-- `header`. Every line is padded to the same width so the art stays
-- aligned when the dashboard centres it.
--
-- NOTE: the v1 built-in commands `SessionLoad` and `DashboardFindHistory` no
-- longer exist in v2; the actions below use the current equivalents.
db.setup({
  theme = 'doom',
  config = {
    header = {
      "                                                                                                    ",
      "                                                 ..                                                 ",
      "                                               ..:^:.                                               ",
      "                                             .:::::^^:.                                             ",
      "                                           .::::.  .:^^:.                                           ",
      "                                         .::::.      .:^^:.                                         ",
      "                                       .:::..          .:^^^.                                       ",
      "                                     .:::.       ....    .:^^^:                                     ",
      "                                   ..::.        :.:::..    .:^^^:                                   ",
      "                                 .::::         .:            .^^^^:.                                ",
      "                                 .::::        .::   .:        ^^^^::.                               ",
      "                                  .:::       :^^^   .:.      .^^^^.                                 ",
      "                                  .:::      .^^^^   :::      .^^^^.                                 ",
      "                                  .:::      ^^^^.  :.        .^^^^.                                 ",
      "                                  .:::     .^::   .:..       .^^^^.                                 ",
      "                                  .:::                       .^^^^.                                 ",
      "                                  ....                        ::::.                                 ",
      "                              ..................::....................                              ",
      "                                                ..::::::::::::::::::::                              ",
      "                                                                                                    ",
      "                                                                                                    ",
      " Stay Hungry, Stay Foolish                                                                          ",
      "                                                                                                    ",
      "                                                                                                    ",
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
