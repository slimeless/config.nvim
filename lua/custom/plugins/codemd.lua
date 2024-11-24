return {
  dir = '~/plugins/codemd.nvim',
  dev = true,
  config = function()
    require('codemd').setup()
  end,
}
