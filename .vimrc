" Andy's .vimrc
" Author: Andy Weaver
" Date: 2024-05-01
" Source: https://github.com/andy-weaver/.nvim

" enable syntax highlighting
syntax on

" set the default tab size to 4 spaces
set tabstop=4

" show the line number + relative line number
set number
set relativenumber

" Gimme that wild menu
set wildmenu

" highlight search & show where you would end up
set is
" set hls

" enable mouse support
set mouse=a

" enable line wrapping
set wrap

" keep indentation levels from previous line
set autoindent

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" remap the leader key to space
let mapleader = " "

" ensure tabs are two spaces when editing a yaml or web file
autocmd FileType yaml,js,jsx,ts,tsx,css,html setlocal ts=2 sts=2 sw=2 expandtab

" ensure tabs are four spaces when editing a sql, python, rust, or vim file
autocmd FileType sql,python,rust,vim setlocal ts=4 sts=4 sw=4 expandtab

" turn on copilot for all filetypes
let g:copilot_filetypes = {
    \ '*': v:true,
\ }

" j+j exits either insert or visual mode 
inoremap JJ <Esc>
inoremap jj <Esc>

set rtp+=/opt/homebrew/opt/fzf
