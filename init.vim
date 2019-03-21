let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME 
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME 



if &compatible
 set nocompatible
endif

let s:dein_dir = expand('$CACHE/dein')
let s:wd = fnamemodify(expand('<sfile>'), ':h')
let s:dein_toml_file = s:wd .'/dein.toml'
let s:dein_vim_toml_file = s:wd . '/dein.vim.toml'
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
 call dein#load_toml(s:dein_toml_file)
 if !has('nvim')
 	call dein#load_toml(s:dein_vim_toml_file)
 endif
 call dein#end()
 call dein#save_state()
 if has('vim_starting') && dein#check_install()
     call dein#install()
 endif
endif


set number
set title
set showmatch
syntax on
set tabstop=2
set smartindent
set clipboard=unnamedplus
set noswapfile
let g:netrw_liststyle= 3
set mouse=a
set shiftwidth=2
set noexpandtab
set hidden
set completeopt=menuone
filetype plugin indent on
syntax enable
set signcolumn=yes
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

let g:LanguageClient_serverCommands ={
	\'go':['bingo'],
\}
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

let g:deoplete#enable_at_startup = 1
let g:rainbow_active = 1
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
let g:neoterm_default_mod = 'botright'
let g:neoterm_autoinsert= 1


nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent>K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent>gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent><F2> :call LanguageClient#textDocument_rename()<CR>
noremap <silent><Space>n :NERDTreeToggle<CR>
noremap <silent><Space>u :NERDTree<CR>
nnoremap <silent><Space>@ :Ttoggle<CR>
tnoremap <C-[>  <C-\><C-n>:Ttoggle<CR>
