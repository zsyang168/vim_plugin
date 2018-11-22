"			__     _____ __  __ ____   ____
"			\ \   / /_ _|  \/  |  _ \ / ___|
"			 \ \ / / | || |\/| | |_) | |
"			  \ V /  | || |  | |  _ <| |___
"			   \_/  |___|_|  |_|_| \_\\____| By yang.zisong
"实用设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 关闭vi的一致性模式，避免以前版本的一些Bug和局限
set nocompatible
set backspace=indent,eol,start
" 共享剪贴板
set clipboard+=unnamed
set clipboard=unnamedplus
" 修改文自动备份
set nobackup
" 文件在Vim之外修改过，自动重新读入"
set autoread
" 设置自动保存内容"
set autowrite
" 配置改动时自动加载
autocmd! bufwritepost vimrc source ~/.vimrc
" 打开文件自动跳到上次编辑的位置
au BufReadPost * if line("'\'") > 1 && line("'\'") <= line("$") | exe "normal! g'\'" | endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 编码格式设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,chinese
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 基本设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 读法高亮
syntax on
" 设置自动对齐
set autoindent
set cindent
set smartindent
" 自动补全配置让Vim补全菜单行为跟IDE一致
set completeopt=longest,menu
" 增强模式中的命令行自动完成操作
set wildmenu
" 设置鼠标可用
"set mouse=a
"set selection=exclusive
"set selectmode=mouse,key
" 设置tab宽度
set tabstop=4
" 设置自动对齐空格数
set shiftwidth=4
" 历史记录数
set history=1000
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 去掉输入错误的提示声音
set noeb
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 显示设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 突出显示当前行
set cursorline
" 设置魔术
set magic
" 显示当前行号和列号
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前Vim模式
set showmode
" 显示行号
set number
" 指定不折行
set nowrap
" 设置代码匹配,包括括号匹配情况
 set showmatch
" 设置搜索高亮(hlsearch)
"set hlsearch
"set incsearch
" 设置搜索时忽略大小写
set ignorecase
" 当搜索的时候尝试smart
set smartcase
" 背景设置
colorscheme solarized
let g:solarized_termtrans=1	"1为使用Terminal的透明背景
set background=dark
" 高亮结尾空格
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
" 总是显示状态行
set laststatus=2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"NERDTree设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"只剩下目录树时则自动关闭目录树
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"当打开vim且没有文件时自动打开NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd vimenter *  NERDTree
" 让Tree把自己给装饰得多姿多彩漂亮点
let NERDChristmasTree=1
" 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
let NERDTreeAutoCenter=1
" 指定鼠标模式(1.双击打开 2.单目录双文件 3.单击打开)
let NERDTreeMouseMode=2
" 是否默认显示书签列表
let NERDTreeShowBookmarks=1
" 是否默认显示文件
let NERDTreeShowFiles=1
" 是否默认显示隐藏文件
let NERDTreeShowHidden=1
" 是否默认显示行号
let NERDTreeShowLineNumbers=0
" 窗口位置（’left’ or ‘right’）
"let NERDTreeWinPos='right'
" 窗口宽度
let NERDTreeWinSize=31
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"新文件标题设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.py,.c,.h,sh,.Java文件，自动插入文件头
autocmd BufNewFile *.py,*.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
	"如果文件类型为.sh文件
	if &filetype == 'sh'
		call setline(1,"\#!/bin/bash")
		call append(line("."), "")
	"如果文件类型为.py文件
	elseif &filetype == 'python'
		call setline(1,"#!/usr/bin/env python")
	    call append(line("."),"# coding=utf-8")
		call append(line(".")+1, "")
	" java file
	elseif &filetype == 'java'
		call setline(1,"public class ".expand('%:r')."{")
		call append(line("."),"")
		call append(line(".")+1,"}")
	"其他类型文件
	else
		call setline(1, "/*************************************************************************")
		call append(line("."), "	> File Name: ".expand("%"))
		call append(line(".")+1, "	> Author:yang.zisong")
		call append(line(".")+2, "	> Mail: yang.zisong@embedway.com")
		call append(line(".")+3, "	> Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
		call append(line(".")+4, " ************************************************************************/")
		call append(line(".")+5, "")
	endif

	"c文件自动包含stdio头文件
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	"头文件自动添加框架
	if expand("%:e") == 'h'
		call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+8, "#endif")
	endif

endfunc

"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 键盘设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagslist开启关闭快捷键
map <F2> :TagbarToggle<CR>
"NERDTree开启关闭快捷键
map <C-j> :NERDTreeToggle<CR>
"C，C++ 按F5编译运行
map <A-F5> :call CompileRunGcc()<CR>
func CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'sh'
		:!./%
	endif
endfunc
" 删除行尾空格
nmap <C-k> :%s/\s\+$//g<CR>
" 关闭行号
nmap <C-\>n :set nu!<CR>
" 开启行号
nmap <C-\>y :set nu<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"自动补全设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<ESC>o}<ESC>O
inoremap ' ''<ESC>i
inoremap " ""<ESC>i

" TEX中常用大括号
autocmd BufEnter *.tex inoremap { {}<ESC>i
autocmd BufEnter *.md inoremap { {}<ESC>i
autocmd BufEnter *.py inoremap { {}<ESC>i
autocmd BufEnter *.vue inoremap { {}<ESC>i
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"cscope设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"快捷键 cscope
"s：查找C代码符号
"g：查找本定义
"d：查找本函数调用的函数
"c：查找调用本函数的函数
"t：查找本字符串
"e：查找本egrep模式
"f：查找本文件
"i：查找包含本文件的文件

if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	if filereadable("cscope.out")
		cs add cscope.out
	else
		let cscope_file=findfile("cscope.out",".;")
		let cscope_pre=matchstr(cscope_file,".*/")
		if !empty(cscope_file)&&filereadable(cscope_file)
			exe "cs add" cscope_file  cscope_pre
		endif
	endif
endif

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"tagbar设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_type_vimwiki = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
                \ 'h:headings',
        \ ],
    \ 'sort' : 0
\ }
""设置tagbar使用的ctags的插件,必须要设置对
let g:tagbar_ctags_bin='/usr/bin/ctags'
"设置tagbar的窗口宽度
let g:tagbar_width=30
"设置tagbar的窗口显示的位置,为左边
let g:tagbar_right=1
"打开文件自动 打开tagbar
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Bundle插件管理设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

"Plugin 'gmarik/vundle'
set tags=tags;
" My Bundles here:
"vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'derekwyatt/vim-scala'
" lua
Plugin 'https://github.com/xolox/vim-misc.git'
Plugin 'https://github.com/xolox/vim-lua-ftplugin.git'

" tagbar
Plugin 'majutsushi/tagbar.git'

" nerdtree
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin  'https://github.com/mattn/emmet-vim.git'
call vundle#end()

filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

