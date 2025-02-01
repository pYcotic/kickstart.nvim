return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  event = 'VeryLazy', -- Load plugin lazily
  config = function()
    -- Set Neovim folding options
    vim.o.foldcolumn = '1' -- Show fold column
    vim.o.foldlevel = 99 -- Start with folds open
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true -- Enable folding

    -- Load ufo.nvim
    require('ufo').setup {
      provider_selector = function(_, _, _)
        return { 'lsp', 'indent' } -- Use LSP and indent-based folding
      end,
    }

    -- Keymaps for folding
    local keymap = vim.keymap.set
    keymap('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
    keymap('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })
    keymap('n', 'zr', require('ufo').openFoldsExceptKinds, { desc = 'Open folds progressively' })
    keymap('n', 'zm', require('ufo').closeFoldsWith, { desc = 'Close folds progressively' })

    -- Enable LSP folding support
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    require('lspconfig').lua_ls.setup {
      capabilities = require('ufo').capabilities,
    }
  end,
}
