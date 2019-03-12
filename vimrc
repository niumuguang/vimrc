" vundle 环境设置
filetype off


set encoding=utf-8
set fenc=cp936
set fileencodings=cp936,ucs-bom,utf-8
" if(g:iswindows==1)
"     source $VIMRUNTIME/delmenu.vim
"     source $VIMRUNTIME/menu.vim
"     language messages zh_CN.utf-8
" endif
if v:lang =~? '^zh\|ja\|ko'
    set ambiwidth=double
endif
set nobomb

set path+=/home/muguang/corder/tradequotes/
set path+=/home/muguang/corder/tradequotes
set path+=/home/muguang/SVN/trunk/corder/Trade2.0/ThirdLib
set path+=/home/muguang/corder/boost_1_67_0/include
set path+=/usr/local/include

set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
"Plugin 'kshenoy/vim-signature'
"Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
"Plugin 'vim-scripts/indexer.tar.gz'
"Plugin 'vim-scripts/DfrankUtil'
"Plugin 'vim-scripts/vimprj'
"Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
"Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
"Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'
Plugin 'jiangmiao/auto-pairs'

Plugin 'git://git.wincent.com/command-t.git'
Plugin 'git://github.com/Xuyuanp/nerdtree-git-plugin.git'
Plugin 'taglist.vim'

"Plugin 'https://github.com/vim-scripts/gdbmgr.git'
Plugin 'https://github.com/lekv/vim-clewn.git'
"Plugin 'vimgdb'
"Plugin 'fking/ag.vim'
Plugin 'https://github.com/907th/vim-auto-save'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'Pydiction'
Plugin 'qpkorr/vim-bufkill'
" 插件列表结束
call vundle#end()
filetype plugin indent on

"配色方案
set background=dark
"colorscheme solarized
colorscheme molokai
"colorscheme phd



" 禁止光标闪烁
" set gcr=a:block-blinkon0
" " 禁止显示滚动条
" set guioptions-=l
" set guioptions-=L
" set guioptions-=r
" set guioptions-=R
" " 禁止显示菜单和工具条
" set guioptions-=m
" set guioptions-=T


"总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch

set ts=4
set sw=4

inoremap <C-l> <Esc>o
inoremap <C-A> <ESC>I
inoremap <C-E> <ESC>A


"nnoremap <F6> .exe NERDTreeToggle<CR>
" autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" autocmd vimenter * NERDTree
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
"map <Leader>fl :NERDTreeToggle<CR>
" " 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" " 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" " 显示隐藏文件
let NERDTreeShowHidden=1
" " NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" " 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1"
" unmap <C-n> 
"nnoremap <C-y> :NERDTree<CR>
nnoremap <F5> :NERDTree<CR>
" nnoremap <C-n> :NERDTree<CR>
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif


let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Sort_Type="name"
map <C-t> :Tlist<CR>


" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
"
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/'  }  }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1



" map <F2> :cs find 

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'


" 开启语法高亮功能
syntax enable
" " 允许用指定语法高亮配色方案替换默认方案
syntax on

" vim-cpp-enhanced-highlight plugin config
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 随 vim 自启动
" let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
" let g:indent_guides_start_level=2
" 色块宽度
" let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
" :nmap <silent> <Leader>i <Plug>IndentGuidesToggle

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" :nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" 色块宽度
let g:indent_guides_guide_size=1
"hi IndentGuidesOdd  ctermbg=black
"hi IndentGuidesEven ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red ctermbg=3 " black 
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=lightgrey ctermbg=lightgrey " darkgrey


" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable


" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>


" 显示/隐藏 MiniBufExplorer 窗口
" map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
"map <C-Tab> :MBEbn<cr>
"map <C-S-Tab> :MBEbp<cr>


" 设置环境保存项
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" " 保存 undo 历史
set undodir=~/.undo_history/
set undofile
" " 保存快捷键
" map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
" " 恢复快捷键
" map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>


let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'} 
let g:AutoPairs['<']='>'
"let b:AutoPairs = g:AutoParis 
let g:AutoPairsShortcutToggle = '<M-p>'
let g:AutoPairsShortcutFastWrap = '<M-e>'
let g:AutoPairsShortcutJump = '<M-n>'
let g:AutoPairsMapBS = 1
let g:AutoPairsMapCR = 1
let g:AutoPairsMapSpace = 1


" ycm 指定 ycm_extra_conf.py
" let g:ycm_global_ycm_extra_conf =  '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf =  '~/.ycm_extra_conf.py'



" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全          
let g:ycm_seed_identifiers_with_syntax=1"


" 开启 YCM 标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
set tags+=/data/misc/software/misc./vim/stdcpp.tags"


" 成员函数的实现顺序与声明顺序一致
" let g:disable_protodef_sorting=
"



" backspace 删除eof配置
set backspace=indent,eol,start
set nocompatible

" 自动补全配置
" ctags -R --c++-kinds=+px --fields=+iaS --extra=+q
" ctags -R --c++-kinds=+px --fields=+aiKSz --extra=+q
" ctags -R --languages=c++ --langmap=c++:+.inl -h +.inl --c++-kinds=+px--fields=+aiKSz --extra=+q --exclude=lex.yy.cc --exclude=copy_lex.yy.cc
set tags=tags;
set autochdir

set ai " 自动缩进
set smartindent "智能对齐
"set gdbprg=/usr/bin/gdb

" easymotion 键盘配置
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)
" insert 模式移动配置
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-f> <Right>
inoremap <C-d> <Left>
inoremap <C-q> <PageUp>
inoremap <C-z> <PageDown>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-x> <Del>

let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

" 自动保存
let g:auto_save = 120
" let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI","CursorHoldI", "CompleteDone"]
" let g:auto_save_events = [ "TextChanged", "TextChangedI","CursorHoldI", "CompleteDone"]
"


let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \}
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

let g:ctrlp_extensions = ['funky']

" map <C-c> :BD<cr>
map <Leader>bd :BD<cr>

" let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_show_diagnostics_ui = 0
" let g:ycm_server_log_level = 'info'
" let g:ycm_min_num_identifier_candidate_chars = 8
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_complete_in_strings=1
" let g:ycm_key_invoke_completion = '<c-z>'
" set completeopt=menu,menuone
"
" noremap <c-p> <NOP>
"
" let g:ycm_semantic_triggers =  {
"             \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
"             \ 'cs,lua,javascript': ['re!\w{2}'],
"             \ }
"
" let g:ycm_filetype_whitelist = {
"             \ "c":1,
"             \ "cpp":1,
"             \ "objc":1,
"             \ "sh":1,
"             \ "zsh":1,
"             \ "zimbu":1,
"             \ }
"

" YouCompleteMe
" " Python Semantic Completion
let g:ycm_python_binary_path = '/usr/bin/python2'
" " C family Completion Path
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" " 跳转快捷键
" nnoremap <c-k> :YcmCompleter GoToDeclaration<CR>|
" nnoremap <c-h> :YcmCompleter GoToDefinition<CR>|
" nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|

" " 停止提示是否载入本地ycm_extra_conf文件
let g:ycm_confirm_extra_conf = 1
" " 语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 4
" " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files = 0
" " 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=4
" " 在注释输入中也能补全
let g:ycm_complete_in_comments = 0
" " 在字符串输入中也能补全
let g:ycm_complete_in_strings = 0
" " 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" " 弹出列表时选择第1项的快捷键(默认为<TAB>和<Down>)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" " 弹出列表时选择前1项的快捷键(默认为<S-TAB>和<UP>)
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" " 主动补全, 默认为<C-Space>
" let g:ycm_key_invoke_completion = ['<C-Space>']
" " 停止显示补全列表(防止列表影响视野), 可以按<C-Space>重新弹出
let g:ycm_key_list_stop_completion = ['<C-y>']
" 关闭诊断显示功能(已经使用了ale进行异步语法检查)
let g:ycm_show_diagnostics_ui = 0
" Go to definition else declaration
" nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" " 主动调用补全
let g:ycm_key_invoke_completion = '<C-a>'

nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>                " turn off YCM
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>                " turn on YCM
