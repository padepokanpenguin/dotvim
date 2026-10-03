-- Session management. Needed by the dashboard's "Recently latest session"
-- entry: the v1 dashboard command `SessionLoad` no longer exists in v2.
-- See https://github.com/folke/persistence.nvim
local status, persistence = pcall(require, 'persistence')
if (not status) then
  return
end

persistence.setup({
  dir = vim.fn.stdpath('state') .. '/sessions/',
  options = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals' },
})

-- Save the session on exit so it can be restored later.
vim.api.nvim_create_autocmd('VimLeavePre', {
  group = vim.api.nvim_create_augroup('UserPersistence', { clear = true }),
  callback = function()
    persistence.save()
  end,
})

vim.keymap.set('n', '<leader>sl', function()
  persistence.load()
end, { desc = 'Session: load last' })

vim.keymap.set('n', '<leader>ss', function()
  persistence.save()
end, { desc = 'Session: save' })

vim.keymap.set('n', '<leader>sh', function()
  require('telescope.builtin').oldfiles()
end, { desc = 'Session/history: recently opened files' })
