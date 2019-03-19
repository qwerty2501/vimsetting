let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME 
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME 

set number
set title
set showmatch
syntax on
set tabstop=2
set smartindent
set clipboard=unnamedplus
set directory=~/.vim/tmp
let g:netrw_liststyle= 3
set mouse=a


if &compatible
 set nocompatible
endif

let s:dein_dir = expand('$CACHE/dein')
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if &runtimepath !~# '/dein.vim'

    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim ' . s:dein_repo_dir
    endif

    execute 'set runtimepath^=' . s:dein_repo_dir

endif

let g:dein#install_max_processes = 16


if dein#load_state(s:dein_dir)
 call dein#begin(s:dein_dir,expand('<sfile>'))
 call dein#load_toml(s:toml_file)
 call dein#end()
 call dein#save_state()
 if has('vim_starting') && dein#check_install()
     call dein#install()
 endif
endif

filetype plugin indent on
syntax enable


