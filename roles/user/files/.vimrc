vim9script

# plug#begin('~/.vim/plugged')

# auto pairing
# Plug 'jiangmiao/auto-pairs'

# plug#end()

set t_Co=256
syntax on
colorscheme eclipse

set number
set expandtab
set tabstop=4

set shiftwidth=4
set smarttab
set smartindent

set colorcolumn=100
set cursorline

set hlsearch
set incsearch

autocmd BufRead,BufWritePre,FileWritePre * silent! %s/[\r \t]\+$//

# mappings

map <C-n> :NERDTreeToggle<CR>
