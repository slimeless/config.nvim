return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = 'BufWritePost',
    cmd = { 'ConformInfo' },

    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,

        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,

      format_after_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt

        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          async = true,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'black' },
        go = { 'goimports', 'gofumpt' },
        c = { 'clang-format' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
