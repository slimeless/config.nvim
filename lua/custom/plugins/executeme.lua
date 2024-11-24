return {
  dir = '~/plugins/execute-everything.nvim',
  dev = true,
  config = function()
    local cmd = require 'executeme.commands'
    vim.keymap.set('n', '<leader>R', function()
      cmd.run_cmd_by_index(1)
    end, { desc = 'Run cmd 1' })
    require('executeme').setup()
  end,
}
