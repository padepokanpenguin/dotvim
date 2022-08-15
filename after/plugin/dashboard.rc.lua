local status, dashboard = pcall(require, 'dashboard')
if (not status) then return end

dashboard.custom_header = {
  "                                                                         .°                                                                ",
  "                                                                     .o#OO°                                                                ",
  "                                                                     *##OO##o.                                                             ",
  "                                                                  °O####OOO##o.                                                            ",
  "                                                                 .O#####*°O#OO#O*                                                          ",
  "                                                               .o##O##*    °O#OO#O*                                                        ",
  "                                                              *##O##o.       *O#OO#O°                                                      ",
  "                                                            °O####o.          .*O#OO#O°                                                    ",
  "                                                          °O####o.              .o#OOO#o°                                                  ",
  "                                                        .o####O°                  .o#OOO#o.                                                ",
  "                                                       *####O°            ..        °O#OO##o.                                              ",
  "                                                     *O###O°           °*o#ooo°°.     °O#OO#O*                                             ",
  "                                                   °O###O*            O* *#oOo°...      *O#OO#O*                                           ",
  "                                                 .o###O*             °#   ..             .oOOOO#O°                                         ",
  "                                               .o###O#o              °#.    ..             OOOOOO#O°                                       ",
  "                                              .ooo####o             °o#*    .#*            OOOOOOOoO*                                      ",
  "                                                 .####o            *#O#o    .##o           OOOOO#o                                         ",
  "                                                 °####o           o#OO#o    °#O#°          OOOOO#o                                         ",
  "                                                 °####o          *#OOO#o    o###o          OOOOO#o                                         ",
  "                                                 °####o         .#OOOO#*    #*o#O          OOOOO#o                                         ",
  "                                                 °####o         o#OOO#O    o#   .          OOOOO#o                                         ",
  "                                                 °####o         OOOO#o.   *#°              OOOOO#o                                         ",
  "                                                 °####o        .##Oo°   .o#OOo°            OOOOO#o                                         ",
  "                                                 .#OO#o         *°.      .  ...            OOOOO#o                                         ",
  "                                                 °####O                                    OOOOOOo                                         ",
  "                                                  °°°°°                                   .######O                                         ",
  "                                           *******°°°°°******************                  *****o*                                         ",
  "                                           oOoooooOOOOOooooooooooooooo###°.............................                                    ",
  "                                                                      o##O############################O                                    ",
  "                                                                      °o*******************************                                    ",
  "",
}

dashboard.custom_center = {
  {
    icon = " ",
    desc = "New File            ",
    action = "DashboardNewFile",
    shortcut = "SPC o",
  },
  {
    icon = " ",
    desc = "Browse Files        ",
    action = "Telescope file_browser",
    shortcut = "SPC n",
  },
  {
    icon = " ",
    desc = "Find File           ",
    action = "Telescope find_files",
    shortcut = "SPC f",
  },
  {
    icon = " ",
    desc = "Configure Neovim    ",
    action = "edit ~/.config/nvim/lua/init.lua",
    shortcut = "SPC v",
  },
  {
    icon = " ",
    desc = "Exit Neovim              ",
    action = "quit",
  },
}

dashboard.hide_statusline = false
dashboard.hide_tabline = false
