set nocompatible # no compatibility with vi
set autoindent # auto indent
set number # line numbers
filetype plugin indent on # filetype detection/plugin/indent
syntax on # highlighting
set clipboard+=unnamedplus # ctrl+c/v enable
set cursorline # show current cursor line


" Press i to enter insert mode, and ii to exit insert mode.
:inoremap ii <Esc>
:inoremap jk <Esc>
:inoremap kj <Esc>
:vnoremap jk <Esc>
:vnoremap kj <Esc>

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
