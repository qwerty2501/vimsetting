let mapleader="\<Space>"
noremap <silent><Leader>N :NERDTreeToggle<CR>
noremap <silent><Leader>n :NERDTree<CR>
nnoremap <silent><Leader>@ :Ttoggle<CR>
nnoremap <silent><Leader><Leader> :Denite file_rec<CR>
nnoremap <silent><Leader>c :T cd %:p:h<CR>
tnoremap <silent><C-w> <C-\><C-n><C-w>
tnoremap <silent><C-q> <C-\><C-n>
tmap <silent><C-d> <C-d><C-\><C-n><CR>:q<CR>
nnoremap <silent><Leader>l "lyiW:e <C-R>l<CR>
nmap <S-O> o<ESC>

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

