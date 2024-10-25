return {
  'mhartington/formatter.nvim',

  config = function()
    require('formatter').setup {
      -- Enable or disable logging
      logging = true,
      -- Set the log level
      log_level = vim.log.levels.WARN,
      -- All formatter configurations are opt-in
      filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        python = {

          require('formatter.filetypes.python').ruff,
          require('formatter.filetypes.python').black,

          -- You can also define your own configuration
        },

        rust = {
          require('formatter.filetypes.rust').rustfmt,
        },

        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
      },
    }
    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd
    augroup('__formatter__', { clear = true })
    autocmd('BufWritePost', {
      group = '__formatter__',
      command = ':FormatWrite',
    })
  end,
}
