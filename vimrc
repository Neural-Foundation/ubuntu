" xuender@gmail.com
" 2015-04-09

" 初始化插件幻镜
if 0 | endif
if &compatible
  set nocompatible
endif
set runtimepath^=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
" 插件管理插件
NeoBundleFetch 'Shougo/neobundle.vim'

" 左侧文件树
NeoBundle 'scrooloose/nerdtree'
" 主体式样
NeoBundle 'tomasr/molokai'
" 文件查找
NeoBundle 'kien/ctrlp.vim'
" 状态栏
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
" html,xml,php
NeoBundle 'tpope/vim-ragtag'
" 补全
NeoBundle 'thisivan/vim-taglist'
NeoBundle 'Shougo/neocomplete.vim'
" 右窗口
NeoBundle 'majutsushi/tagbar'
" 整套的 Golang Vim 开发配置
NeoBundle 'fatih/vim-go'
" typescrip
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Quramy/tsuquyomi'
" typescript 语法高亮
NeoBundle 'leafgarland/typescript-vim' 
" 窗口管理
" NeoBundle 'vim-scripts/winmanager'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
" 自动读取文件变化
set autoread
" 保存.vimrc 是自动装载
autocmd! bufwritepost .vimrc source ~/.vimrc
" 开启语法高亮
syntax enable
syntax on
set t_Co=256
set background=dark
"配色方案
" color desert
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
" 设置字体 Monaco 10pt
set gfn=Monospace\ 11
" 三键鼠标
set mouse=a
" 垂直移动 7 行,调整当前位置
set so=7
" 命令自动补全 tab
set wildmenu
" 显示光标位置
set ruler
" 命令栏高度2
" set cmdheight=1
" 显示行号
set nu
" 高亮当前行
set cursorline
hi CursorLine cterm=NONE ctermbg=24 guibg=24
"hi cursorline guibg=#ff00ff
" hi CursorColumn guibg=#dddd33
" 菜单颜色
hi Pmenu guibg=#333333
hi PmenuSel guibg=#555555 guifg=#ffffff
" 运行宏命令时不重绘,加速
set lz
" 更改缓存不保存
set hid
" 设置删除键
set backspace=eol,start,indent
" 移动到行末自动移动到下行起始
set whichwrap+=<,>,h,l
" 搜索忽略大小写
set ignorecase
set incsearch
"Set magic on
set magic
" 错误时静音
set noerrorbells
set novisualbell
set t_vb=
" 显示括号匹配
set showmatch
" 光标闪烁时间
set mat=2
" 高亮搜索
set hlsearch
" 历史记录数量
set history=2000
" 首选文件类型
set ffs=unix,mac,dos
" 打开折叠
set nofen
set fdl=0
" 制表符
set shiftwidth=2
set ts=2
set sts=2
set expandtab
" 自动缩进
set ai
" 智能缩进
set si
" 换行
set wrap
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
" 中文乱码
set encoding=utf-8
set helplang=cn
" 粘帖乱码设置
set termencoding=utf-8
set fileencodings=utf-8,gb18030,gbk,gb2312,big5
set fileformats=unix
autocmd BufEnter * :syntax sync fromstart
" 总显示最后一个窗口的状态行
set laststatus=2
" 快捷键
let mapleader = ","
let g:mapleader = ","
" ctrl+方向实现窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" 快速保存
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
" 打开左侧文件树
map <leader>d :NERDTree<CR>
" 打开右窗口
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <leader>t :TagbarToggle<CR>
" 标签配制
" 新标签
map <F3> :tabnew<CR>
" 上个标签
map <F2> :tabn<CR>
" 关闭标签
map <F4> :tabclose<CR>
" 保存session
map <F12> :mksession!<CR>
try
  set switchbuf=usetab
  set stal=2
catch
endtry
" tagbar 支持 typescript
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }
" tagbar 支持 Golang
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
" 状态栏主题
let g:airline_theme="luna" 
let g:airline_powerline_fonts = 1
" 状态栏打开tabline功能,方便查看Buffer和切换
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" 改变缓冲文件
map <right> :bn<cr>
map <left> :bp<cr>
 " 关闭状态显示空白符号计数,这个对我用处不大"
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
" 开启自动补全
let g:neocomplete#enable_at_startup = 1
" 智能大小写
let g:neocomplete#enable_smart_case = 1
" <TAB>: 补全
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType typescript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
