
" VUNDLE STUFF
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'

Plugin 'hashivim/vim-terraform'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-fugitive'
Plugin 'gcmt/taboo.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'Glench/Vim-Jinja2-Syntax'

call vundle#end()
filetype plugin indent on
" END VUNDLE STUFF

autocmd BufNewFile,BufRead *.tfvars set syntax=tf
syntax on
filetype plugin indent on
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
colorscheme jeff
" Allows sessions to maintain tab names
set sessionoptions+=tabpages,globals

" Key mappings
nnoremap <unique> <C-x><C-f> :FZF<CR>
