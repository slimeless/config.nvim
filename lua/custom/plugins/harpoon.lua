return {
  'ThePrimeagen/harpoon',
  config = function()
    local harpoon = require 'harpoon'
    local mark = require 'harpoon.mark'
    local ui = require 'harpoon.ui'
    vim.keymap.set('n', '<leader>a', mark.add_file)
    vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

    -- Set <space>1..<space>5 be my shortcuts to moving to the files
    for _, idx in ipairs { 1, 2, 3, 4, 5 } do
      vim.keymap.set('n', string.format('<leader>%d', idx), function()
        ui.nav_file(idx)
      end)
    end
  end,
}
