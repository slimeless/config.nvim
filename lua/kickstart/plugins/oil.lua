return {
  {
    'stevearc/oil.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function ()
        require('oil').setup({
            skip_confirm_for_simple_edits = true
        })
    end
  },
}
-- vim: ts=2 sts=2 sw=2 et

