return {
  'monkoose/neocodeium',
  event = 'VeryLazy',
  config = function()
    local ncdeium = require 'neocodeium'
    ncdeium.setup {
      filetypes = {
        rust = false,
        oil = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        ['.'] = false,
      },
    }
    vim.keymap.set({ 'i', 'n' }, '<A-f>', function()
      require('neocodeium').accept()
    end)
    vim.keymap.set({ 'i', 'n' }, '<A-w>', function()
      require('neocodeium').accept_word()
    end)
    vim.keymap.set({ 'i', 'n' }, '<A-a>', function()
      require('neocodeium').accept_line()
    end)
    vim.keymap.set({ 'i', 'n' }, '<A-]>', function()
      require('neocodeium').cycle_or_complete()
    end)
    vim.keymap.set({ 'i', 'n' }, '<A-[>', function()
      require('neocodeium').cycle_or_complete(-1)
    end)
    vim.keymap.set({ 'i', 'n' }, '<A-c>', function()
      require('neocodeium').clear()
    end)
    vim.keymap.set({ 'i', 'n' }, '<A-d>', function()
      local status = require('neocodeium').get_status()
      if status == 2 or status == 3 then
        require('neocodeium.commands').enable_buffer()
        print 'codeium enabled in buffer'
      elseif status == 0 then
        require('neocodeium.commands').disable_buffer()
        print 'codeium disabled in buffer'
      end
    end)
  end,
}
