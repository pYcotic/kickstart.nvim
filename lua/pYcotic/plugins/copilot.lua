return {
  'zbirenbaum/copilot.lua', -- The GitHub Copilot plugin for Neovim
  config = function()
    -- Setup copilot.lua with basic configuration
    require('copilot').setup {
      suggestion = {
        enabled = true, -- Enable Copilot suggestions
        auto_trigger = true, -- Automatically trigger suggestions
        debounce = 75, -- Debounce delay between keystrokes and suggestions
        keymap = {
          accept = '<C-Enter>', -- Accept suggestion keybinding
          next = '<C-n>', -- Next suggestion keybinding
          prev = '<C-p>', -- Previous suggestion keybinding
        },
      },
      panel = {
        enabled = true, -- Enable Copilot suggestion panel
        keymap = {
          accept = '<C-Enter>', -- Accept suggestion from panel
        },
      },
    }

    -- Key mappings for Copilot suggestions (optional)
    vim.api.nvim_set_keymap('i', '<C-Enter>', '<Cmd>Copilot accept<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('i', '<C-n>', '<Cmd>Copilot next<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('i', '<C-p>', '<Cmd>Copilot prev<CR>', { noremap = true, silent = true })
  end,
}
