" =============================================
" Author:taihou.nie
" Date:2017-10-20
" Note: Don't put anything in your .vimrc you don't understand!
" Get a vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" ===============================
" Basic settings.
" 修改leader键
let mapleader = ','
let g:mapleader = ','
" 开启语法高亮
syntax on
"history存储容量
set history=2000
" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on
" 备份,到另一个位置. 防止误删, 目前是取消备份
"set backup
"set backupext=.bak
"set backupdir=/tmp/vimbk/
" 取消备份。 视情况自己改
"set nobackup
" 关闭交换文件
"set noswapfile
"设置不显示的文件类型
"set wildignore=*.swp,*.bak,*.pyc,*.class,.svn
" 突出显示当前列
"set cursorcolumn
" 突出显示当前行
set cursorline
" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=
" 鼠标暂不启用, 键盘党....
" set mouse-=a
" 启用鼠标
" set mouse=a
" Hide the mouse cursor while typing
" set mousehide
" 修复ctrl+m
" 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
set selection=inclusive
set selectmode=mouse,key
" change the terminal's title
set title
" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
set t_vb=
set tm=500
" Remember info about open buffers on close
set viminfo^=%
" For regular expressions turn magic on
set magic
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l


"==========================================
" Display Settings 展示/排版等界面格式设置
"==========================================
" 显示当前的行号列号
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode
" 不兼容VI,去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7
" Always show the status line - use 2 lines for the status bar
set laststatus=2
" 行号
"set nonumber
"set number
" 换行开关
nnoremap <F2> :set number! number?<CR>
" 行号栏的宽度
set numberwidth=4
" 换行
"set wrap
"set nowrap
"" 换行开关
nnoremap <F4> :set wrap! wrap?<CR>
" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2

" 设置文内智能搜索提示
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" 缩进配置
" Smart indent
set smartindent
" 打开自动缩进
" never add copyindent, case error   " copy the previous indentation on autoindenting
set autoindent
" 将-连接符也设置为单词
set isk+=-

" tab相关变更
" 设置Tab键的宽度[等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop
" set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
" set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast

" 00x增减数字时使用十进制
set nrformats=

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
"set relativenumber number
"au FocusLost * :set norelativenumber number
"au FocusGained * :set relativenumber

"==========================================
" FileEncode Settings 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8
"set background=dark
" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B


" Auto add head info
" .py file into add header
function HeaderPython()
    call setline(1, "#!/usr/bin/env python")
    call append(1, "# -*- coding: utf-8 -*-")
    normal G
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()

" .sh file
function HeaderBash()
    call setline(1, "#!/usr/bin/env bash")
    normal G
    normal o
endf
autocmd bufnewfile *.sh call HeaderBash()
" Python 的PEP8风格
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 cc=80 textwidth=79 expandtab autoindent fileformat=unix
" 其他语言的风格
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2 softtabstop=2 shiftwidth=2
" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


"======================
" Vundle
filetype off
" 自定义需要的插件集合
if !exists('g:bundle_groups')
    " let g:bundle_groups=['python', 'javascript', 'golang', 'php', 'ruby', 'shell', 'markdown', 'html', 'css', 'less', 'coffeescript', 'tmux', 'json', 'beta']
    let g:bundle_groups=['python', 'javascript', 'markdown', 'html', 'css', 'tmux', 'beta']
endif
" set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()



Plugin 'VundleVim/Vundle.vim'
" 主题 solarized
" solarized
Plugin 'altercation/vim-colors-solarized'
" molokai
" 主题 molokai
Plugin 'tomasr/molokai'

" wakatime 2cd57dbc-02fd-44de-9f53-e4b4e93a6ca2
Plugin 'wakatime/vim-wakatime'

" syntastic
if v:version < 800
    Plugin 'scrooloose/syntastic'
else
    Plugin 'w0rp/ale'
endif

" nerdtree nerdtreetabs
Plugin 'scrooloose/nerdtree'

" quick locate file or function
" 文件搜索
Plugin 'ctrlp.vim'

Plugin 'Yggdroot/indentLine'

" tagbar
Plugin 'majutsushi/tagbar'

" ctrlsf
" 类似sublimetext的搜索
" In CtrlSF window:
" 回车/o, 打开
" t       在tab中打开(建议)
" T - Lkie t but focus CtrlSF window instead of opened new tab.
" q - Quit CtrlSF window.
Plugin 'dyng/ctrlsf.vim'

" 状态栏增强展示
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" 代码自动补全
" 迄今为止用到的最好的自动VIM自动补全插件
Plugin 'Valloric/YouCompleteMe'

" 快速注释
Plugin 'scrooloose/nerdcommenter'

" trailingwhitespace
" 快速去行尾空格 [, + <Space>]
Plugin 'bronson/vim-trailing-whitespace'

" easyalign
" 快速赋值语句对齐
Plugin 'junegunn/vim-easy-align'

" quick selection and edit
" expandregion
" 选中区块
Plugin 'terryma/vim-expand-region'

" 更高效的行内移动, f/F/t/T, 才触发
" quickscope,这个有坑
" Plugin 'unblevable/quick-scope'

" 多光标选中编辑
" multiplecursors
Plugin 'terryma/vim-multiple-cursors'

" 括号显示增强
Plugin 'kien/rainbow_parentheses.vim'

" quickrun
Plugin 'thinca/vim-quickrun'

" gundo
" edit history, 可以查看回到某个历史状态
Plugin 'sjl/gundo.vim'

" git
" fugitive
Plugin 'tpope/vim-fugitive'
" gitgutter
Plugin 'airblade/vim-gitgutter'

Plugin 'ack.vim'
if count(g:bundle_groups, 'python')
    " for python.vim syntax highlight
    " pythonsyntax
    Plugin 'hdima/python-syntax'
    Plugin 'hynek/vim-python-pep8-indent'
    Plugin 'Glench/Vim-Jinja2-Syntax'

    " isort  https://github.com/timothycrosley/isort#readme + https://github.com/fisadev/vim-isort#installation
    " pip install isort
    Plugin 'fisadev/vim-isort'
    " Shift-V 上下选中, ctrl + i 规范化
    let g:vim_isort_map = '<C-i>'
endif


call vundle#end()
filetype plugin indent on

" ################### 显示增强-主题 ###################"

" solarized {{{
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    " let g:solarized_termcolors=256
" }}}

" molokai {{{
    " monokai原始背景色
    let g:molokai_original = 1
    let g:rehash256 = 1
" }}}

" ################### 快速导航 ###################

" nerdtree nerdtreetabs {{{
    " map <leader>n :NERDTreeToggle<CR>
	map <F1> :NERDTreeToggle<CR>
    let NERDTreeHighlightCursorline=1
    let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
    "close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
    " s/v 分屏打开文件
    let g:NERDTreeMapOpenSplit = 's'
    let g:NERDTreeMapOpenVSplit = 'v'


    " 关闭同步
    " let g:nerdtree_tabs_synchronize_view=0
    " let g:nerdtree_tabs_synchronize_focus=0
    " 是否自动开启nerdtree
    " thank to @ListenerRi, see https://github.com/wklken/k-vim/issues/165
    let g:nerdtree_tabs_open_on_console_startup=0
    let g:nerdtree_tabs_open_on_gui_startup=0
" }}}



" Plugin tagbar settings.
map <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Pluging ctrlp settings.
map <C-b>p :CtrlP<CR>

" trailingwhitespace {{{
    map <leader><space> :FixWhitespace<cr>
" }}}

" Plugin ctrlsf settings.
" ctrlsf {{{
    nmap \ <Plug>CtrlSFCwordPath<CR>
    " let g:ctrlsf_position = 'below'
    " let g:ctrlsf_winsize = '30%'
	" Make sure you have ack or ag installed. 
	let g:ctrlsf_ackprg = 'ack'
    let g:ctrlsf_auto_close = 0
    let g:ctrlsf_confirm_save = 0
    " Note: cannot use <CR> or <C-m> for open
    " Use : <sapce> or <tab>
    let g:ctrlsf_mapping = {
        \ "open"  : "<Space>",
        \ "openb" : "O",
        \ "tab"   : "t",
        \ "tabb"  : "T",
        \ "prevw" : "p",
        \ "quit"  : "q",
        \ "next"  : "<C-J>",
        \ "prev"  : "<C-K>",
        \ "pquit" : "q",
        \ }
" }}}

" ale {{{
" if has_key(g:plugs, 'ale')
    " pip install flake8
    " npm install -g eslint eslint-plugin-standard eslint-plugin-promise eslint-config-standard
    " npm install -g eslint-plugin-import eslint-plugin-node eslint-plugin-html babel-eslint
    let g:ale_linters = {
    \   'python': ['flake8'],
    \   'javascript': ['eslint'],
    \}

    " E501 -> 120 chars
    let g:ale_python_flake8_args="--ignore=E114,E116,E131 --max-line-length=120"
    " --ignore=E225,E124,E712,E116
    "  If emoji not loaded, use default sign
	try
		let g:ale_sign_error = emoji#for('boom')
		let g:ale_sign_warning = emoji#for('small_orange_diamond')
	catch
		let g:ale_sign_error = '>>'
		let g:ale_sign_warning = '>'
	endtry

    let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
    let g:ale_echo_msg_error_str = '✹ Error'
    let g:ale_echo_msg_warning_str = '⚠ Warning'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

    nmap <silent> <Leader>ep <Plug>(ale_previous_wrap)
    nmap <silent> <Leader>en <Plug>(ale_next_wrap)

    nnoremap <silent> <Leader>ec :ALEToggle<CR>

    " troggle quickfix list
    function! ToggleErrors()
        let old_last_winnr = winnr('$')
        lclose
        if old_last_winnr == winnr('$')
            " Nothing was closed, open syntastic_error location panel
            lopen
        endif
    endfunction
    nnoremap <Leader>s :call ToggleErrors()<cr>

    let g:ale_set_highlights = 1
    highlight clear ALEErrorSign
    highlight clear ALEWarningSign
" endif

" }}}

" Plugin indentLine settings.
let g:indentLine_char = "|"
let g:indentLine_enabled = 1
let g:autopep8_disable_show_diff=1

"" Plugin airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="luna"

" ################### 语言相关 ###################

" quickrun {{{
    let g:quickrun_config = {
    \   "_" : {
    \       "outputter" : "message",
    \   },
    \}

    let g:quickrun_no_default_key_mappings = 1
    nmap <Leader>r <Plug>(quickrun)
    map <F10> :QuickRun<CR>
" }}}

" pythonsyntax {{{
    let python_highlight_all = 0
" }}}


" Plugin YCM settings.
"set completeopt=longest,menu
"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
 "注释和字符串中的文字不会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"let g:ycm_collect_identifiers_from_tags_files = 1
" 开启语法关键字补全,语言关键字补全, 不过python关键字都很短，所以，需要的自己打开
let g:ycm_seed_identifiers_with_syntax=1
" 回车作为选中
let g:ycm_key_list_stop_completion = ['<CR>']

" 跳转到定义处, 分屏打开
let g:ycm_goto_buffer_command = 'horizontal-split'
let g:ycm_register_as_syntastic_checker = 0
" nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

"if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
"    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
"endif
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" 直接触发自动补全 insert模式下
" let g:ycm_key_invoke_completion = '<C-Space>'



