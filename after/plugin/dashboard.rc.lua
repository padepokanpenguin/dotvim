local home = os.getenv('HOME')
local status, db = pcall(require, 'dashboard')
if (not status) then
  return
end

db.custom_header = { "",
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
  "", "", " Stay Hungry, Stay Foolish ", "", "" }

db.custom_center = { {
  icon = '  ',
  desc = 'Recently latest session                 ',
  shortcut = 'SPC s l',
  action = 'SessionLoad'
}, {
  icon = '  ',
  desc = 'Recently opened files                   ',
  action = 'DashboardFindHistory',
  shortcut = 'SPC f h'
}, {
  icon = '  ',
  desc = 'Find  File                              ',
  action = 'Telescope find_files find_command=rg,--hidden,--files',
  shortcut = 'SPC f f'
}, {
  icon = '  ',
  desc = 'File Browser                            ',
  action = 'Telescope file_browser',
  shortcut = 'SPC f b'
}, {
  icon = '  ',
  desc = 'Find  word                              ',
  action = 'Telescope live_grep',
  shortcut = 'SPC f w'
}, {
  icon = '  ',
  desc = 'Open Personal dotfiles                  ',
  action = 'Telescope dotfiles path=' .. home .. '/.dotfiles',
  shortcut = 'SPC f d'
} }

db.custom_footer = { 'Penguin House Co.' }

db.hide_statusline = false
db.hide_tabline = false
