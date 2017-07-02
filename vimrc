"buffer切换，ctrl+o,ctrl+i
"分屏:sb,
"b空格tab显示所有文件
"vim -O 分屏方式打开多个文件;sp水平分屏;vs垂直分屏;
"行与TAB显示
set cursorline
set nu
"set cursorcolumn
set tabstop=4
set pastetoggle=<C-P> " Ctrl-P toggles paste mode
"手动折叠
set foldmethod=manual
set foldlevelstart=99
set foldlevel=99

"设置编码
set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac
"自动缩进
set smarttab
"搜索忽略大小写
set ignorecase
"设置tab长度
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
"设置主题
set t_Co=256
colorscheme molokai
let g:molokai_original = 1
"语法高亮
filetype plugin indent on
syntax on
"解决golang语法不高亮问题
au BufRead,BufNewFile *.go set filetype=go 
"禁止临时文件
set nobackup
set noswapfile
"搜索
set hlsearch
set incsearch
"缓冲区通配符
set wildmenu wildmode=full 
set wildchar=<Tab> wildcharm=<C-Z>
noremap <c-n> :b <c-z>

" mac 退格键
set backspace=2

"窗口设置
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"显示当前tab标记
fu! SeeTab()
  if !exists("g:SeeTabEnabled")
        let g:SeeTabEnabled = 1
        let g:SeeTab_list = &list
        let g:SeeTab_listchars = &listchars
        let regA = @a
        redir @a
        hi SpecialKey
        redir END
        let g:SeeTabSpecialKey = @a
        let @a = regA
        silent! hi SpecialKey guifg=black guibg=magenta ctermfg=black ctermbg=magenta
        set list
        set listchars=tab:>.,trail:.,extends:#,nbsp:.
  else
        let &list = g:SeeTab_list
        let &listchars = &listchars
        silent! exe "hi ".substitute(g:SeeTabSpecialKey,'xxx','','e')
        unlet g:SeeTabEnabled g:SeeTab_list g:SeeTab_listchars
  endif
endfunc
com! -nargs=0 SeeTab :call SeeTab()

nmap tt :SeeTab <CR><CR>



"插件管理
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
"Plugin 'davidhalter/jedi-vim'
Plugin 'AutoComplPop'
"html plugin
Plugin 'mattn/emmet-vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'Raimondi/delimitMate'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Bundle 'vim-scripts/matchit.zip'
" golang
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
call vundle#end()
filetype plugin indent on


"插件设置
map <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=0
let NERDTreeShowBookmarks=1
let g:NERDTreeIgnore=['\.job$', '^CVS$', '\.orig', '\~$']
let g:NERDTreeShowHidden=1
let g:NERDTreeStatusline="%f"
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=35
" Close vim if the only window left is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" jedi 
set omnifunc=jedi#completions


" YouCompleteMe
"let g:ycm_always_populate_location_list = 0
"let g:ycm_auto_trigger=1
"let g:ycm_enable_diagnostic_highlighting=1
"let g:ycm_enable_diagnostic_signs=1
"let g:ycm_max_diagnostics_to_display=10000
"let g:ycm_min_num_identifier_candidate_chars=0
"let g:ycm_min_num_of_chars_for_completion=2
"let g:ycm_open_loclist_on_ycm_diags=1
"let g:ycm_show_diagnostics_ui=1
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_filetype_blacklist={
"            \ 'vim' : 1,
"            \ 'tagbar' : 1,
"            \ 'qf' : 1,
"            \ 'notes' : 1,
"            \ 'markdown' : 1,
"            \ 'md' : 1,
"            \ 'unite' : 1,
"            \ 'text' : 1,
"            \ 'vimwiki' : 1,
"            \ 'pandoc' : 1,
"            \ 'infolog' : 1,
"            \ 'mail' : 1
"            \}
"
"" YouCompleteMe Omni-Completion
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
"
"" YouCompleteMe key bindings
"nnoremap <F11> :YcmForceCompileAndDiagnostics<CR>
"nnoremap <F12> :YcmDiags<CR>
"
"" YcmCompleter Subcommands
"nnoremap <silent> <Leader>yd :YcmCompleter GetDoc<CR>
"nnoremap <silent> <Leader>yf :YcmCompleter FixIt<CR>
"nnoremap <silent> <Leader>yg :YcmCompleter GoTo<CR>
"nnoremap <silent> <Leader>yi :YcmCompleter GoToInclude<CR>
"nnoremap <silent> <Leader>yt :YcmCompleter GetType<CR>

" Tagbar
nnoremap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus=0
let g:tagbar_right=1
let g:tagbar_width=35



