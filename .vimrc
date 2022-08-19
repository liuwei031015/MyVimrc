"expandtab，把制表符转换为多个空格，具体空格数量参考 tabstop 和 shiftwidth 变量；
"tabstop 与 shiftwidth 是有区别的。tabstop 指定我们在插入模式下输入一个制表符占据的空格数量，
"linux 内核编码规范建议是 8，看个人需要；shiftwidth 指定在进行缩进格式化源码时制表符占据的空格数。
"所谓缩进格式化，指的是通过 vim 命令由 vim 自动对源码进行缩进处理，比如其他人的代码不满足你的缩进要求，
"你就可以对其进行缩进格式化。缩进格式化，需要先选中指定行，要么键入 = 让 vim 对该行进行智能缩进格式化，
"要么按需键入多次 < 或 > 手工缩进格式化；
"阅读其他人的代码吧，他们对制表符定义规则与你不同，这时你可以手工执行 vim 的
"retab 命令，让 vim 按上述规则重新处理制表符与空格关系
"softtabstop，如何处理连续多个空格。因为 expandtab 已经把制表符转换为空格，
"当你要删除制表符时你得连续删除多个空格，该设置就是告诉 vim 把连续数量的空格视为一个制表符，即，
"只删一个字符即可。通常应将这tabstop、shiftwidth、softtabstop 三个变量设置为相同值；
"inoremap就只在插入(insert)模式下生效
"vnoremap只在visual模式下生效
"nnoremap就在normal模式下(狂按esc后的模式)生效
"inoremap命令用于映射按键
 " :i代表是在插入模式（insert）下有效
  ":nore表示不递归no recursion，例如：inoremap Y y和 inoremap y Y并不会出现无限循环
  ":map映射
  
" 关闭兼容模式
set nocompatible
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

"set foldmethod=indent  "基于缩进进行代码折叠
set foldmethod=syntax   "基于语法进行代码折叠
" 启动 vim 时关闭折叠代码
set nofoldenable
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

"修改配置立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"禁止折行
set nowrap

" 当文件在外部被修改时，自动读取
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" 快速保存
nmap <leader>s :w!<cr>

"由于权限原因保存报错，可使用W命令强制保存
" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
" 当移到文件开头或结尾 7 行时，按j/k 会开始滑动
set so=7

" Avoid garbled characters in Chinese language windows OS
" 解决部分系统中文乱码的问题
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
" 解决空格键失灵问题
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
" 搜索时忽略大小写
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
"搜索时，高亮所有匹配项
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
" 正则表达式模式设置为magic
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
" 匹配括号时闪烁的十分之几秒
set mat=2

" No annoying sound on errors
" 关闭错误提示音
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
" 在左侧添加额外的边距
set foldcolumn=1

set nu
set tags=./.tags;,.tags,~/.cache/androidSourceCtags/.tags


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
" 启用语法高亮
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme desert
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
" unix作为标准文件类型。处理不同系统文件分隔符差异相关
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
" 关闭备份，因为大多数东西在git,svn中
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
" 使用空格代替tab
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
" 500个字符换行
set lbr
set tw=500

set ai "Auto indent 自动缩进
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
" 可视模式时，使用*和#搜索当前选择的块
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" 定义space 和 ctrl+ space 去搜索
map <space> /
map <C-space> ?

" Disable highlight when <leader><cr> is pressed
" leader + enter 取消搜索高亮
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
" 窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
" 打开文件时返回上次编辑的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
" 一直显示状态栏
set laststatus=2

" Format the status line
" 格式化状态栏显示的信息
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
" 0 映射成 ^，都是移到当前行开头第一个非空字符
"map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
" 保存时删除后面的空格
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
" leader + ss 切换是否开启拼写检查
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
" 删掉Windows文件中的 ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
" 打开关闭粘贴模式
map <leader>pp :setlocal paste!<cr>
"弹窗颜色
highlight Pmenu           ctermfg=Gray        guifg=#FFFFFF     ctermbg=DarkGray    guibg=#0F0F0F
highlight PmenuSel        ctermfg=White       guifg=#0F0F0F     ctermbg=Gray        guibg=#F0F0F0
highlight PmenuSbar       ctermfg=NONE        guifg=NONE        ctermbg=DarkGray    guibg=#777777
highlight PmenuThumb      ctermfg=Gray        guifg=#F0F0F0     ctermbg=NONE        guibg=NONE


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions  定义上面设置中使用到的方法
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
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

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" =============================================================================
" " Plugin Manager Setup
" "
" =============================================================================
" "
" Install the plugin manager if it doesn't exist
let s:plugin_manager=expand('~/.vim/autoload/plug.vim')
let s:plugin_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"
if empty(glob(s:plugin_manager))
  echom 'vim-plug not found. Installing...'
  if executable('curl')
    silent exec '!curl -fLo ' . s:plugin_manager . ' --create-dirs ' .
          \ s:plugin_url
  elseif executable('wget')
    call mkdir(fnamemodify(s:plugin_manager, ':h'), 'p')
    silent exec '!wget --force-directories --no-check-certificate -O ' .
          \ expand(s:plugin_manager) . ' ' . s:plugin_url
  else
    echom 'Could not download pluginmanager. No plugins were installed.'
    finish
  endif
  augroup vimplug
    autocmd!
    autocmd VimEnter * PlugInstall
  augroup END
endif

"Create a horizontal split at the bottom when installing plugins
let g:plug_window = 'botright new'
"
let g:plug_dir = expand('~/.vim/plugged')
call plug#begin(g:plug_dir)
"
"头文件与源文件切换插件
"Plug 'vim-scripts/a.vim',{'for':['c','cpp']}
" """ All of your Plugins must be added before the following line
Plug 'dense-analysis/ale'
"Plug 'dart-lang/dart-vim-plugin',{'for':'dart'}
"Plug 'natebosch/vim-lsc', { 'on' : 'Lsc'}
"Plug 'natebosch/vim-lsc-dart',{'for':'dart'}
"Plug 'thosakwe/vim-flutter',{'for':'dart'}
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'hsanson/vim-android'
Plug 'tomasr/molokai'
"Plug 'vim-scripts/phd'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'enricobacis/vim-airline-clock'
"Plug 'justinmk/vim-dirvish'
Plug 'ludovicchabant/vim-gutentags'
"Plug 'vim-scripts/VimIM'
"Plug 'tpope/vim-sensible'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
Plug 'Valloric/YouCompleteMe',{'for':['c','cpp','objc','objcpp','vim','sh','zsh','python']}
"Plug 'artur-shaik/vim-javacomplete2'
" " Add plugins to &runtimepath
call plug#end()   "required

"LeaderF configuration start
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

"文件搜索
let g:Lf_ShortcutF = '<leader>ff'
"buffer搜索
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
"搜索最近使用的文件
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
"搜索tags，需要ctags支持
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
"搜索当前文件内容
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
"搜索当前光标下
noremap <leader>fx :<C-U><C-R>=printf("Leaderf file --input %s ", expand("<cword>"))<CR><CR>

"当前buffer中搜索光标下的文本
noremap <leader>wb :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
"项目全局搜索光标下的文本
noremap <leader>wf :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
"显示上一条命令结果
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
"LeaderF configuration end

"gutentags configuration start
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持： 
let g:gutentags_modules = [] 
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args = ['--output-format=e-ctags']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
"gutentags configuration end
 
let g:gradle_path = '/opt/gradle/gradle-7.5.1/bin/gradle'
let g:android_sdk_path = '/opt/android-sdk'
let g:gradle_loclist_show = 1
let g:gradle_show_signs = 1
"
"
"let g:ale_linters = {
"     \ 'xml': ['android'],
"     \ 'groovy': ['android'],
"     \ 'java': ['android', 'checkstyle', 'javalsp'],
"     \ 'kotlin': ['android', 'ktlint', 'languageserver']
"     \ }
"
"" Set this. Airline will handle the rest.
"let g:airline#extensions#ale#enabled = 1
"
"call airline#parts#define_function(
"       \ 'gradle-running',
"       \ 'lightline#gradle#running'
"       \)
"call airline#parts#define_function(
"       \ 'gradle-errors',
"       \ 'lightline#gradle#errors'
"       \)
"call airline#parts#define_function(
"       \ 'gradle-warnings',
"       \ 'lightline#gradle#warnings'
"       \)
"call airline#parts#define_function(
"       \ 'gradle-project',
"       \ 'lightline#gradle#project'
"       \)
"let g:airline_section_x= airline#section#create_right([
"     \ 'filetype',
"     \ 'gradle-running',
"     \ 'gradle-errors',
"     \ 'gradle-warnings'
"     \])
"let g:lsc_server_commands = {'java':'/home/longse/.vimPlugConfig/java-language-server/dist/lang_server_linux.sh'}
"
"" Use all the defaults (recommended):
"let g:lsc_auto_map = v:true
"
"" Apply the defaults with a few overrides:
"let g:lsc_auto_map = {'defaults': v:true, 'FindReferences': '<leader>r'}
"
"" Setting a value to a blank string leaves that command unmapped:
"let g:lsc_auto_map = {'defaults': v:true, 'FindImplementations': ''}

"" ... or set only the commands you want mapped without defaults.
"" Complete default mappings are:
"let g:lsc_auto_map = {
"    \ 'GoToDefinition': '<C-]>',
"    \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
"    \ 'FindReferences': 'gr',
"    \ 'NextReference': '<C-n>',
"    \ 'PreviousReference': '<C-p>',
"    \ 'FindImplementations': 'gI',
"    \ 'FindCodeActions': 'ga',
"    \ 'Rename': 'gR',
"    \ 'ShowHover': v:true,
"    \ 'DocumentSymbol': 'go',
"    \ 'WorkspaceSymbol': 'gS',
"    \ 'SignatureHelp': 'gm',
"    \ 'Completion': 'completefunc',
"    \}

set omnifunc=ale#completion#OmniFunc
let g:ale_completion_autoimport = 1
let g:ale_completion_enabled = 1
let g:ale_linters = {
            \ 'xml': ['android'],
            \ 'groovy': ['android'],
            \ 'java': ['eclipselsp'],
            \ 'kotlin': ['android', 'ktlint', 'languageserver']
            \ }
"let g:ale_java_javalsp_executable ='/home/longse/.vimPlugConfig/java-language-server/dist/lang_server_linux.sh'
let g:ale_java_javalsp_executable ='/home/longse/.vimPlugConfig/javalspSrc/dist/lang_server_linux.sh'
"let g:ale_java_eclipselsp_path ='/home/longse/.tools/eclipse/jdt2'
let g:ale_java_eclipselsp_path ='/home/longse/.vimPlugConfig/eclipse.jdt.ls'
let g:ale_java_eclipselsp_executable = '/usr/lib/jvm/java-17-amazon-corretto/bin/java'

let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '!'
let g:signify_sign_change_delete     = g:signify_sign_change . g:signify_sign_delete_first_line

let g:molokai_original = 1
let g:rehash256 = 1

call ch_logfile(expand('~/channel.log'),'a')
