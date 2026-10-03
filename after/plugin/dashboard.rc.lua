local status, db = pcall(require, 'dashboard')
if (not status) then
  return
end

-- dashboard-nvim v2 configuration (see https://github.com/nvimdev/dashboard-nvim)
-- The ASCII banner below used to be assigned to a misspelled option
-- (`cusom_footer`) and therefore never rendered; it is now used as the header.
db.setup({
  theme = 'doom',
  config = {
    header = { "",
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
  "", "", " Stay Hungry, Stay Foolish ", "", ""
    },
    center = {
      {
        icon = '  ',
        desc = 'Recently latest session                 ',
        shortcut = 'SPC s l',
        action = 'SessionLoad'
      },
      {
        icon = '  ',
        desc = 'Recently opened files                   ',
        action = 'DashboardFindHistory',
        shortcut = 'SPC f h'
      },
      {
        icon = '  ',
        desc = 'Find  File                              ',
        action = 'Telescope find_files find_command=rg,--hidden,--files',
        shortcut = 'SPC f f'
      },
      {
        icon = '  ',
        desc = 'File Browser                            ',
        action = 'Telescope file_browser',
        shortcut = 'SPC f b'
      },
      {
        icon = '  ',
        desc = 'Find  word                              ',
        action = 'Telescope live_grep',
        shortcut = 'SPC f w'
      },
    },
    footer = { 'Penguin House Co.' },
  },
})
