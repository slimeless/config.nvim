return {
  'mrcjkb/rustaceanvim',
  version = vim.fn.has 'nvim-0.10.0' == 0 and '^4' or false,
  ft = { 'rust' },
  opts = {
    server = {
      on_attach = function(_, bufnr)
        vim.keymap.set('n', '<leader>cr', function()
          vim.cmd.RustLsp 'codeAction'
        end, { desc = 'Code Action', buffer = bufnr })
        vim.keymap.set('n', '<leader>cd', function()
          vim.cmd.RustLsp 'debuggables'
        end, { desc = 'Rust Debuggables', buffer = bufnr })
        -- vim.keymap.set('n', '<leader>R', '<CMD>vsplit | terminal cargo run<CR>')
        -- vim.keymap.set('n', '<leader>T', '<CMD>vsplit | terminal cargo test<CR>')
      end,
      default_settings = {
        -- rust-analyzer language server configuration
        ['rust-analyzer'] = {
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            buildScripts = {
              enable = true,
            },
          },
          -- Add clippy lints for Rust.
          checkOnSave = true,
          procMacro = {
            enable = true,
            ignored = {
              ['async-trait'] = { 'async_trait' },
              ['napi-derive'] = { 'napi' },
              ['async-recursion'] = { 'async_recursion' },
            },
          },
        },
      },
    },
  },
  config = function(_, opts)
    vim.g.rustaceanvim = vim.tbl_deep_extend('keep', vim.g.rustaceanvim or {}, opts or {})
  end,
}
