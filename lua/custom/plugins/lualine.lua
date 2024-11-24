local colors = {
  blue = '#80a0ff',
  cyan = '#79dac8',
  black = '#080808',
  white = '#c6c6c6',
  red = '#ff5189',
  violet = '#d183e8',
  grey = '#303030',
}
local diagnostic = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    error = { fg = colors.red },
    warn = { fg = colors.yellow },
    info = { fg = colors.cyan },
  },
}

local lsp = {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' ',
  color = { fg = '#d9afb0', gui = 'bold' },
}
local diff = {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
}
local stub = { sections = { lualine_a = { 'progress' } }, filetypes = { 'startup', 'leetcode.nvim' } }

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local neocodeium = { -- NeoCodeium Status
      function()
        local status = require('neocodeium').get_status()

        -- Tables to map serverstatus and status to corresponding symbols
        local status_symbols = {
          [0] = '󰚩 ', -- Enabled
          [1] = '󱚧 ', -- Disabled Globally
          [3] = '󱚢 ', -- Disabled for Buffer filetype
          [5] = '󱚠 ', -- Disabled for Buffer encoding
          [2] = '󱙻 ', -- Disabled for Buffer (catch-all)
        }

        -- Handle serverstatus and status fallback (safeguard against any unexpected value)
        local luacodeium = status_symbols[status] or '󱚧 '

        return luacodeium
      end,
      cond = require('neocodeium').is_enabled,
    }

    require('lualine').setup {
      options = {
        theme = 'auto',
        component_separators = '',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { 'filename', 'branch', neocodeium, diagnostic },
        lualine_c = {
          '%=',
          lsp --[[ add your center compoentnts here in place of this comment ]],
        },
        lualine_x = {},
        lualine_y = { diff, 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      extensions = { 'oil', 'fugitive', stub },
    }
  end,
}
