return {
  dir = '~/plugins/watch-plugins.nvim',
  dev = true,
  config = function()
    require('watch_plugins').setup {
      dev_dir = '~/plugins',
    }
  end,
}
