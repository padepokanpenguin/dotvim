local status, lualine = pcall(require, "lualine")
if (not status) then
  return
end

-- -- try git status

-- helper function to loop over string lines
-- copied from https://stackoverflow.com/a/19329565
local function iterlines(s)
  if s:sub(-1) ~= "\n" then s = s .. "\n" end
  return s:gmatch("(.-)\n")
end

-- find directory
function find_dir(d)
  -- return if root
  if d == '/' then
    return d
  end
  -- check renaming
  local ok, err, code = os.rename(d, d)
  if not ok then
    if code ~= 2 then
      -- all other than not existing
      return d
    end
    -- not existing
    local newd = d:gsub("(.*/)[%w._-]+/?$", "%1")
    return find_dir(newd)
  end
  -- d ok write 'ok_dir' variable & return d
  vim.b["ok_dir"] = d
  return d
end

-- get git status
local function git_status()
  -- get & check file directory
  local file_dir = vim.b["ok_dir"]
  if file_dir == nil then
    file_dir = find_dir(vim.fn.expand("%:p:h"))
  end
  -- capture git status call
  local cmd = "git -C " .. file_dir .. " status --porcelain -b 2> /dev/null"
  local handle = assert(io.popen(cmd, 'r'), '')
  -- output contains empty line at end (removed by iterlines)
  local output = assert(handle:read('*a'))
  -- close io
  handle:close()

  --  (| not in output, marks start and end of first two chars for readability)
  -- first line, head:
  --   ## master...origin/master => up to date => green
  --   ## master...origin/master [ahead 1] => ahead of origin => green + arrows up ↑
  --   ## master...origin/master [behind 1] => behind origin => green + arrows down ↓
  --   ## master...origin/master [ahead 1, behind 1] => both
  --   ## HEAD (no branch) => HEAD detached => purple
  -- following lines, files:
  --   |??| => untracked file
  --   | D| => deleted = modified
  --   |R | => renamed = staged
  --   etc. first char staged, second char modified

  -- iterate over lines
  -- git_state is array with entries branch/staged/modified/untracked
  local git_state = { '', '', '', '' }
  -- branch coloring: 'o': up to date with origin; 'd': head detached; 'm': not up to date with origin
  local branch_col = 'o'

  -- check if git repo
  if output == '' then
    -- not a git repo
    -- save to variable
    vim.g.git_state = git_state
    -- exit
    return branch_col
  end

  -- get line iterator
  local line_iter = iterlines(output)

  -- process first line (HEAD)
  local line = line_iter()
  if line:find("%(no branch%)") ~= nil then
    -- detached head
    branch_col = 'd'
  else
    -- on branch
    local ahead = line:gsub(".*ahead (%d+).*", "%1")
    local behind = line:gsub(".*behind (%d+).*", "%1")
    -- convert non-numeric to nil
    ahead = tonumber(ahead)
    behind = tonumber(behind)
    if behind ~= nil then
      git_state[1] = '↓ ' .. tostring(behind) .. ' '
    end
    if ahead ~= nil then
      git_state[1] = git_state[1] .. '↑ ' .. tostring(ahead) .. ' '
    end
  end

  -- loop over residual lines (files) &
  -- store number of files
  local git_num = { 0, 0, 0 }
  for line in line_iter do
    branch_col = 'm'
    -- get first char
    local first = line:gsub("^(.).*", "%1")
    if first ~= ' ' then
      if first == '?' then
        -- untracked
        git_num[3] = git_num[3] + 1
      else
        -- staged
        git_num[1] = git_num[1] + 1
      end
    else
      -- modified
      git_num[2] = git_num[2] + 1
    end
  end

  -- build output string
  if git_num[1] ~= 0 then
    git_state[2] = '● ' .. git_num[1]
  end
  if git_num[2] ~= 0 then
    git_state[3] = '+ ' .. git_num[2]
  end
  if git_num[3] ~= 0 then
    git_state[4] = '… ' .. git_num[3]
  end

  -- save to variable
  vim.b.git_state = git_state

  -- return color for branch
  return branch_col
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
    lualine_b = { {
      'branch',
      color =
      function(section)
        local gs = git_status()
        if gs == 'd' then
          return { fg = '#916BDD' }
        elseif gs ~= 'm' then
          return { fg = '#769945' }
        end
      end
    },
      {
        -- head status
        "vim.b.git_state[1]",
        padding = { left = 0, right = 0 }
      },
      {
        -- staged files
        "vim.b.git_state[2]",
        color = { fg = '#769945' },
        padding = { left = 0, right = 1 }
      },
      {
        -- modified files
        "vim.b.git_state[3]",
        color = { fg = '#D75F00' },
        padding = { left = 0, right = 1 }
      },
      {
        -- untracked files
        "vim.b.git_state[4]",
        color = { fg = '#D99809' },
        padding = { left = 0, right = 1 }
      }, },
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
