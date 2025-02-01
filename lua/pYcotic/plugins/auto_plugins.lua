-- plugins that do not need settings
return {
  'tpope/vim-fugitive',
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {
    'tpope/vim-commentary',
    lazy = false,
  },
  { 'Bilal2453/luvit-meta', lazy = true },
}
