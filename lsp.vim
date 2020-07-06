let g:LanguageClient_rootMarkers = {
			 \ 'go': ['go.mod', '.git'],
			 \ }
let g:LanguageClient_serverCommands ={
	\'go':['gopls'],
	\'typescript': ['typescript-language-server', '--stdio'],
	\'c':['clangd','-compile-commands-dir=' . getcwd()],
	\'cpp':['clangd','-compile-commands-dir=' . getcwd()],
	\'rust':['rust-analyzer'],
	\'html':['html-languageserver','--stdio'],
	\'scss':['css-languageserver','--stdio'],
	\'json':['vscode-json-languageserver','--stdio'],
\}

function LC_maps()
	if has_key(g:LanguageClient_serverCommands,&filetype)
		nnoremap <F5> :call LanguageClient_contextMenu()<CR>
		nnoremap <silent>K :call LanguageClient#textDocument_hover()<CR>
		nnoremap <silent>gd :call LanguageClient#textDocument_definition()<CR>
		nnoremap <silent><F2> :call LanguageClient#textDocument_rename()<CR>
	endif
endfunction

function LC_format()
	if get(g:,'lc_format',0)
		call LanguageClient#textDocument_formatting_sync()
	endif
endfunction
autocmd FileType * call LC_maps()
autocmd BufWritePre * call LC_format()
