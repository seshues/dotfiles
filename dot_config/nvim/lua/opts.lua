local opt=vim.opt
opt.number=true
opt.relativenumber=true
opt.signcolumn='yes'

opt.scrolloff=5
opt.sidescrolloff=5

opt.hlsearch=true
opt.incsearch=true

opt.mouse:append 'a'
opt.clipboard:append 'unnamedplus'

opt.tabstop=2
opt.softtabstop=2
opt.shiftwidth=2
opt.expandtab=true
opt.autoindent=true

opt.ignorecase=true
opt.smartcase=true

opt.swapfile=false
opt.autoread=true
vim.bo.autoread=true

opt.cursorline=true
opt.termguicolors=true

vim.api.nvim_create_autocmd('TextYankPost',{
  callback=function()
    vim.highlight.on_yank()
  end
})
