autocmd BufNewFile,BufRead *.tfvars set syntax=tf
execute pathogen#infect()
syntax on
filetype plugin indent on
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
colorscheme jeff
