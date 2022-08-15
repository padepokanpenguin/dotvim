local status, lualine = pcall(require, "lualine")
if (not status) then
  return
end


lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    section_separators = {
      left = '',
      right = ''
    },
    component_separators = {
      left = '',
      right = ''
    },
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = { {
      'mode',
      icons_enabled = true, -- Enables the display of icons alongside the component.
      -- Defines the icon to be displayed in front of the component.
      -- Can be string|table
      -- As table it must contain the icon as first entry and can use
      -- color option to custom color the icon. Example:
      -- {'branch', icon = ''} / {'branch', icon = {'', color={fg='green'}}}

      -- icon position can also be set to the right side from table. Example:
      -- {'branch', icon = {'', align='right', color={fg='green'}}}
      icon = { ' ', align = 'left', color = { fg = '#282828' } },

      color = nil, -- The default is your theme's color for that section and mode.

      -- Specify what type a component is, if omitted, lualine will guess it for you.
      --
      -- Available types are:
      --   [format: type_name(example)], mod(branch/filename),
      --   stl(%f/%m), var(g:coc_status/bo:modifiable),
      --   lua_expr(lua expressions), vim_fun(viml function name)
      --
      -- Note:
      -- lua_expr is short for lua-expression and vim_fun is short for vim-function.
      type = nil,

      padding = .01, -- Adds padding to the left and right of components.
      -- Padding can be specified to left or right independently, e.g.:
      --   padding = { left = left_padding, right = right_padding }

    } },
    lualine_b = { 'branch' },
    lualine_c = {
      {
        'filename',
        file_status = true, -- Displays file status (readonly status, modified status)
        newfile_status = false, -- Display new file status (new file means no write after created)
        path = 1, -- 0: Just the filename
        -- 1: Relative path
        -- 2: Absolute path
        -- 3: Absolute path, with tilde as the home directory

        shorting_target = 5, -- Shortens path to leave 40 spaces in the window
        -- for other components. (terrible name, any suggestions?)
        symbols = {
          modified = ' פֿ ', -- Text to show when the file is modified.
          readonly = '  ', -- Text to show when the file is non-modifiable or readonly.
          unnamed = '  ', -- Text to show for unnamed buffers.
          newfile = '  ', -- Text to show for new created file before first writting
        }
      }
    },
    lualine_x = { {
      'diagnostics',
      sources = { "nvim_diagnostic" },
      symbols = {
        error = ' ',
        warn = ' ',
        info = ' ',
        hint = ' '
      }
    }, 'encoding', 'filetype', {
      'fileformat',
      symbols = {
        unix = ' Unix', -- e712
        dos = ' Windows', -- e70f
        mac = ' MacOs', -- e711
      }
    } },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = { {
      'filename',
      file_status = true, -- Displays file status (readonly status, modified status)
      newfile_status = false, -- Display new file status (new file means no write after created)
      path = 0, -- 0: Just the filename

      shorting_target = 40, -- Shortens path to leave 40 spaces in the window
      -- for other components. (terrible name, any suggestions?)
      symbols = {
        modified = '[+]', -- Text to show when the file is modified.
        readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
        newfile = '[New]' -- Text to show for new created file before first writting
      }
    } },
    lualine_b = {},
    lualine_z = { function()
      return [[PenguinHouse]]
    end }
  },
}
