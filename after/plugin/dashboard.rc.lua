local status, db = pcall(require, 'dashboard')
if (not status) then
  return
end

-- dashboard-nvim v2 configuration (see https://github.com/nvimdev/dashboard-nvim)
-- The ASCII header (torii gate + penguin) is converted from the project
-- logo image (kept small so it is not cut off in narrow terminals); the
-- bottom of the image is cropped so the drop shadow is not rendered. The previous banner was lost to a misspelled option
-- (`cusom_footer`) and therefore never rendered.
--
-- NOTE: the v1 built-in commands `SessionLoad` and `DashboardFindHistory` no
-- longer exist in v2; the actions below use the current equivalents.
db.setup({
  theme = 'doom',
  config = {
    header = {
      "-:                            :-",
      ".@@%#*++===----------===++*#%@@:",
      " .*@@@@@@@@@@@@@@@@@@@@@@@@@@*.",
      "   *%##@@@%#%%%@@%%%#%@@@##%*",
      "       +@@:    @@    :@@+",
      "       -@@     @@     @@-",
      "    :.*%@@%=.::@@::.=%@@%*.:",
      "   .@@@@@@@@@@@@@@@@@@@@@@@@.",
      "    +++#@@*++++++++++*@@#+++",
      "       :@@            @@-",
      "       -@@.           @@-",
      "       -@@            @@-",
      "       -@@            @@-",
      "       -@@            @@-",
      "       -@@   :+*=**   @@-",
      "       -@@    #@@%:   @@-",
      "       -@@   :****:   @@-",
      "       -@@   -:**:-   @@-",
      "       -@@   *....*   @@-",
      "       -@@  :@    @:  @@-",
      "       -@@. *#    #*  @@-",
      "       -@@. *+    +* .@@-",
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
