"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold
colorscheme evening
set nowrap
setlocal spell spelllang=en_us
set expandtab
"hard tabstop size
set tabstop=2

"indent size
set shiftwidth=2
"whatever a soft tab is....
set softtabstop=2
set cinkeys=0{,0},:,0#,!,!^F
