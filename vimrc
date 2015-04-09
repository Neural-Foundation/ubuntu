" xuender@gmail.com
" 2013-12-09

if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
 " Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'
"NeoBundle 'othree/xml'
NeoBundle 'othree/html5.vim'
NeoBundle 'vim-scripts/lookupfile'
"NeoBundle 'klen/python-mode'
NeoBundle 'bolasblack/vimcdoc'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'jnwhiteh/vim-golang'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'thisivan/vim-taglist'
NeoBundle 'clones/vim-genutils'
NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
NeoBundle 'xuender/vim-template'
NeoBundleCheck

filetype off

filetype plugin indent on     " Required!

" 自动换行对齐
"set autoindent 
"set smartindent
" Installation check.

" 历史记录数量
set history=2000

" 自动读取文件变化
set autoread

" 三键鼠标
set mouse=a

"Set mapleader
let mapleader = ","
let g:mapleader = ","

" 快速保存
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

"Fast reloading of the .vimrc
"map <leader>s :source ~/vim_local/vimrc<cr>
"Fast editing of .vimrc
"map <leader>e :e! ~/vim_local/vimrc<cr>
" 保存.vimrc 是自动装载
autocmd! bufwritepost .vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 颜色和字体
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 开启语法高亮
syntax on

" 设置字体 Monaco 10pt
set gfn=Monospace\ 11
"配色方案
color desert

autocmd BufEnter * :syntax sync fromstart

" 高亮当前行
"if has("gui_running")
  set cursorline
  hi cursorline guibg=#333333
  hi CursorColumn guibg=#333333
"endif

" 菜单颜色
hi Pmenu guibg=#333333
hi PmenuSel guibg=#555555 guifg=#ffffff

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件格式
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 首选文件类型
set ffs=unix,dos,mac

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM 用户接口
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 垂直移动 7 行,调整当前位置
set so=7

" 命令自动补全 tab
set wildmenu

" 显示光标位置
set ruler

" 命令栏高度2
set cmdheight=1

" 显示行号
set nu

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

""""""""""""""""""""""""""""""
" 状态行
""""""""""""""""""""""""""""""
" 总是隐藏
set laststatus=2

function! CurDir()
  let curdir = substitute(getcwd(), '/home/ender/', "~/", "g")
  return curdir
endfunction

" 格式化状态行
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

""""""""""""""""""""""""""""""
" 视觉
""""""""""""""""""""""""""""""
" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" 按,* ,# 搜索当前词句,很有用
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 移动和制表符
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 空格查找
map <space> /
map <c-space> ?

" ctrl+方向实现窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 缓冲区
nmap <leader>bd :Bclose<cr>
"map <down> <leader>bd
" 改变缓冲文件
map <right> :bn<cr>
map <left> :bp<cr>

" 标签配制
map <leader>tn :tabnew %<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
try
  set switchbuf=usetab
  set stal=2
catch
endtry

" 移动编辑
imap <M-$> <esc>$a
imap <M-0> <esc>0i
nmap <M-$> $a
nmap <M-0> 0i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一般自动命令
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 切换到当前目录
map <leader>cd :cd %:p:h<cr>

au BufNewFile,BufRead *.\(vim\)\@! inoremap " ""<esc>:let leavechar='"'<cr>i
au BufNewFile,BufRead *.\(txt\)\@! inoremap ' ''<esc>:let leavechar="'"<cr>i

imap <m-l> <esc>:exec "normal f" . leavechar<cr>a
imap <d-l> <esc>:exec "normal f" . leavechar<cr>a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一般 Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 时间
iab xdate <c-r>=strftime("%y-%m-%d %H:%M:%S")<cr>
iab xname 徐晨阳

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 重新定义0
map 0 ^

" 移动一行文本 alt+j,alt+k
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
" alt+o 增加空行
nmap <M-o> o<esc>

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

set completeopt=menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 命令行配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! Cwd()
  let cwd = getcwd()
  return "e " . cwd 
endfunc

func! DeleteTillSlash()
  let g:cmd = getcmdline()
  let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  if g:cmd == g:cmd_edited
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
  endif
  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc

" 命令行替换变量
cno $h ~/
cno $d ~/Desktop/
cno $j ./

cno $q <C-\>eDeleteTillSlash()<cr>

cno $c e <C-\>eCurrentFileDir("e")<cr>

cno $tc <C-\>eCurrentFileDir("tabnew")<cr>
cno $th tabnew ~/
cno $td tabnew ~/Desktop/

"Bash like
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap <C-K>    <C-U>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓冲
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 打开缓冲
map <c-q> :sb

" 虚拟粘帖缓冲
map <leader>q :e ~/buffer<cr>

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" session 相对目录
set sessionoptions-=curdir
set sessionoptions+=sesdir

" 恢复一切
map <F9> ggVGg?

" 删除缓冲禁止关闭窗口
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件备份
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动备份关闭
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 打开折叠
set nofen
set fdl=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本选项
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shiftwidth=2
set ts=2
set sts=2
set expandtab
set ai

map <leader>t2 :set shiftwidth=2<cr>
map <leader>t4 :set shiftwidth=4<cr>
au FileType html,python,vim,javascript setl shiftwidth=2
au FileType html,python,vim,javascript setl tabstop=2
au FileType java setl shiftwidth=4
au FileType java setl tabstop=4
" autocmd FileType python setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79

set smarttab
set lbr
set tw=500

""""""""""""""""""""""""""""""
" 缩进
""""""""""""""""""""""""""""""
" 自动缩进
set ai

" 智能缩进
set si

"C-style indeting
set cindent

" 换行
set wrap
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" shell 检查
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" Vim Grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn'
let Grep_Cygwin_Find = 1

""""""""""""""""""""""""""""""
" Yank Ring
""""""""""""""""""""""""""""""
map <leader>y :YRShow<cr>

""""""""""""""""""""""""""""""
" Tag list (ctags) - not used
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = "/usr/bin/ctags-exuberant"
let Tlist_Sort_Type = "name"
let Tlist_Show_Menu = 1
"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File = 1
"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1 
let Tlist_Auto_Highlight_Tag=1
let Tlist_Auto_Open=1  
let Tlist_Auto_Update=1
let Tlist_Display_Tag_Scope=1
let Tlist_Enable_Dold_Column=1  
let Tlist_File_Fold_Auto_Close=1  
let Tlist_Use_SingleClick=1
"nnoremap <silent> <F8> :TlistToggle<CR>
map <leader>r :TlistToggle<CR>
map <leader>t :Tlist<cr>


""""""""""""""""""""""""""""""
" lookupfile 文件查找
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
if filereadable("./filenametags")                "设置tag文件的名字
  let g:LookupFile_TagExpr = '"./filenametags"'
endif
"映射LookupFile为,lk
nmap <silent> <leader>lk <Plug>LookupFile<cr>
"映射LUBufs为,ll
"nmap <silent> <leader>ll :LUBufs<cr>
"映射LUWalk为,lw 
"nmap <silent> <leader>lw :LUWalk<cr>

""""""""""""""""""""""""""""""
" netrw 文件浏览
""""""""""""""""""""""""""""""
let g:netrw_winsize = 30
nmap <silent> <leader>ee :Sexplore!<cr> 

""""""""""""""""""""""""""""""
" LaTeX Suite things
""""""""""""""""""""""""""""""
set grepprg=grep\ -nH\ $*
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_ViewRule_pdf='xpdf'

" 绑定
autocmd FileType tex map <silent><leader><space> :w!<cr> :silent! call Tex_RunLaTeX()<cr>

" 自动完成
autocmd FileType tex inoremap $i \indent
autocmd FileType tex inoremap $* \cdot
autocmd FileType tex inoremap $i \item
autocmd FileType tex inoremap $m \[<cr>\]<esc>O

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件类型设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Todo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au BufNewFile,BufRead *.todo so ~/vim_local/syntax/amido.vim

""""""""""""""""""""""""""""""
" VIM
""""""""""""""""""""""""""""""
autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>


""""""""""""""""""""""""""""""
" HTML 相关
""""""""""""""""""""""""""""""
" HTML xml 插件
let xml_use_xhtml = 1
"let xml_no_auto_nesting = 1

"To HTML
let html_use_css = 1
let html_number_lines = 0
let use_xhtml = 1

""""""""""""""""""""""""""""""
" Ruby & PHP section
""""""""""""""""""""""""""""""
autocmd FileType ruby map <buffer> <leader><space> :w!<cr>:!ruby %<cr>
autocmd FileType php compiler php
autocmd FileType php map <buffer> <leader><space> <leader>cd:w<cr>:make %<cr>

""""""""""""""""""""""""""""""
" Python section
""""""""""""""""""""""""""""""
"Run the current buffer in python - ie. on leader+space

"au FileType python so ~/.vim/syntax/python.vim
autocmd FileType python map <buffer> <leader><space> :w!<cr>:!python %<cr>
"autocmd FileType python so ~/vim_local/plugin/python_fold.vim

autocmd FileType python set omnifunc=pythoncomplete#Complete  
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags  
autocmd FileType css set omnifunc=csscomplete#CompleteCSS  
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags  
autocmd FileType php set omnifunc=phpcomplete#CompletePHP  
autocmd FileType c set omnifunc=ccomplete#Complete
let g:pydiction_location='~/.vim/tools/pydiction/complete-dict'
"Set some bindings up for 'compile' of python
autocmd FileType python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd FileType python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

"Python iMaps
au FileType python set cindent
au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $s self
au FileType python inoremap <buffer> $c ##<cr>#<space><cr>#<esc>kla
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $d """<cr>"""<esc>O

"Run in the Python interpreter
function! Python_Eval_VSplit() range
  let src = tempname()
  let dst = tempname()
  execute ": " . a:firstline . "," . a:lastline . "w " . src
  execute ":!python " . src . " > " . dst
  execute ":pedit! " . dst
endfunction
au FileType python vmap <F7> :call Python_Eval_VSplit()<cr>
let g:pylint_show_rate = 0
" let g:pylint_cwindow = 0

""""""""""""""""""""""""""""""
" Cheetah section
"""""""""""""""""""""""""""""""
autocmd FileType cheetah set ft=xml
autocmd FileType cheetah set syntax=cheetah

"""""""""""""""""""""""""""""""
" Vim section
"""""""""""""""""""""""""""""""
autocmd FileType vim set nofen

"""""""""""""""""""""""""""""""
" Java section
"""""""""""""""""""""""""""""""
au FileType java inoremap <buffer> <C-t> System.out.println();<esc>hi


""""""""""""""""""""""""""""""
" HTML
"""""""""""""""""""""""""""""""
au FileType html,cheetah set ft=xml
au FileType html,cheetah set syntax=html


""""""""""""""""""""""""""""""
" C mappings
"""""""""""""""""""""""""""""""
autocmd FileType c map <buffer> <leader><space> :w<cr>:!gcc %<cr>


"""""""""""""""""""""""""""""""
" SML
"""""""""""""""""""""""""""""""
autocmd FileType sml map <silent> <buffer> <leader><space> <leader>cd:w<cr>:!sml %<cr>


""""""""""""""""""""""""""""""
" Scheme bidings
""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.scm map <buffer> <leader><space> <leader>cd:w<cr>:!petite %<cr>
autocmd BufNewFile,BufRead *.scm inoremap <buffer> <C-t> (pretty-print )<esc>i
autocmd BufNewFile,BufRead *.scm vnoremap <C-t> <esc>`>a)<esc>`<i(pretty-print <esc>


""""""""""""""""""""""""""""""
" SVN section
"""""""""""""""""""""""""""""""
"map <F8> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg


""""""""""""""""""""""""""""""
" 片段
"""""""""""""""""""""""""""""""
"You can use <c-j> to goto the next <++> - it is pretty smart ;)

"""""""""""""""""""""""""""""""
" Python
"""""""""""""""""""""""""""""""
autocmd FileType python inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement("def <++>(<++>):\n<++>\nreturn <++>")<cr>
autocmd FileType python inorea <buffer> cclass <c-r>=IMAP_PutTextWithMovement("class <++>:\n<++>")<cr>
autocmd FileType python inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for <++> in <++>:\n<++>")<cr>
autocmd FileType python inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if <++>:\n<++>")<cr>
autocmd FileType python inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if <++>:\n<++>\nelse:\n<++>")<cr>

set foldmethod=indent

"""""""""""""""""""""""""""""""
" HTML
"""""""""""""""""""""""""""""""
autocmd FileType cheetah,html inorea <buffer> cahref <c-r>=IMAP_PutTextWithMovement('<a href="<++>"><++></a>')<cr>
autocmd FileType cheetah,html inorea <buffer> cbold <c-r>=IMAP_PutTextWithMovement('<b><++></b>')<cr>
autocmd FileType cheetah,html inorea <buffer> cimg <c-r>=IMAP_PutTextWithMovement('<img src="<++>" alt="<++>" />')<cr>
autocmd FileType cheetah,html inorea <buffer> cpara <c-r>=IMAP_PutTextWithMovement('<p><++></p>')<cr>
autocmd FileType cheetah,html inorea <buffer> ctag <c-r>=IMAP_PutTextWithMovement('<<++>><++></<++>>')<cr>
autocmd FileType cheetah,html inorea <buffer> ctag1 <c-r>=IMAP_PutTextWithMovement("<<++>><cr><++><cr></<++>>")<cr>

"Presse c-q insted of space (or other key) to complete the snippet
imap <C-q> <C-]>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"For Cope
map <silent> <leader><cr> :noh<cr>

"Orginal for all
map <leader>n :cn<cr>
map <leader>p :cp<cr>
map <leader>c :botright cw 10<cr>
map <c-u> <c-l><c-j>:q<cr>:botright cw 10<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remove the Windows ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

"Remove indenting on empty lines
map <F2> :%s/\s*$//g<cr>:noh<cr>''

"Super paste
inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

"A function that inserts links & anchors on a TOhtml export.
" Notice:
" Syntax used is:
" Link
" Anchor
function! SmartTOHtml()
  TOhtml
  try
    %s/&quot;\s\+\*&gt; \(.\+\)</" <a href="#\1" style="color: cyan">\1<\/a></g
    %s/&quot;\(-\|\s\)\+\*&gt; \(.\+\)</" \&nbsp;\&nbsp; <a href="#\2" style="color: cyan;">\2<\/a></g
    %s/&quot;\s\+=&gt; \(.\+\)</" <a name="\1" style="color: #fff">\1<\/a></g
  catch
  endtry
  exe ":write!"
  exe ":bd"
endfunction


" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python setlocal et | setlocal sta | setlocal sw=4
" 代码自动补全 用 Ctrl-N 调用
autocmd FileType python set complete+=k~/.vim/pydiction isk+=.,(
"回到上次文件打开所在行
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal g'\"" | endif
" Flex 开发
"au BufNewFile,BufRead *.mxml set filetype=mxml  
au BufWritePost *.mxml ! fmake.py <afile>
au BufWritePost .vimrc source ~/.vimrc

"显示TAB字符为<+++
" set list
" set list listchars=tab:<+

"输入法扩展文件
let g:vimim_privates_txt="/home/ender/.vim/plugin/ender.txt"

" 设置路径
set path=.,,

" 项目扩展
if filereadable("workspace.vim")
  source workspace.vim
endif

"映射常用操作
map [r :! python % <CR>
map [t :! nosetests<CR>
map <F2> :tabn<CR>
map <F3> :tabnew<CR>
map <F4> :tabclose<CR>
map <F12> :mksession!<CR>
map <leader>d :NERDTree<CR>

" 中文乱码
set encoding=utf-8
set helplang=cn

" 粘帖乱码设置
set termencoding=utf-8
set fileencodings=utf-8,gb18030,gbk,gb2312,big5
set fileformats=unix

" CoffeeScript 可以实现保存时候自动编译成js文件
autocmd QuickFixCmdPost * nested cwindow | redraw!
au BufWritePost *.coffee silent make -b --output /tmp
" 折叠
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
"au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
" 缩进
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual


" template
let g:email='xuender@gmail.com'
let g:username='ender xu'
