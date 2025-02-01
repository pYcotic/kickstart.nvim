-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Keybinds to navigate the buffer and directories
-- set quick page change
vim.keymap.set('n', '<leader>bv', '<cmd>Ex<CR>', { desc = 'Exit the buffer into the current directory' })
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { desc = 'Jump to next buffer' })
vim.keymap.set('n', '<leader>bN', '<cmd>bprevious<CR>', { desc = 'Jump to previous buffer' })

vim.keymap.set({ 'n', 'x' }, '<leader>p', '"0p', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'x' }, '<leader>P', '"0P', { noremap = true, silent = true })

-- Move line up in Normal mode
-- Move line down in Normal mode
vim.keymap.set('n', 'J', ':m .+1<CR>==', { desc = 'Move line down in normal mode' })
vim.keymap.set('n', 'K', ':m .-2<CR>==', { desc = 'Move line up in normal mode' })

-- Move line up in Visual mode
-- Move line down in Visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down in visual mode' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up in visual mode' })

-- yank to Clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])
