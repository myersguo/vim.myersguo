"buffer切换，ctrl+o,ctrl+i
"分屏:sb,
"b空格tab显示所有文件
"vim -O 分屏方式打开多个文件;sp水平分屏;vs垂直分屏;
"行与TAB显示
set cursorline
set cursorcolumn
set tabstop=4
set pastetoggle=<C-P> " Ctrl-P toggles paste mode
"手动折叠
set foldmethod=manual
set foldlevelstart=99
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

