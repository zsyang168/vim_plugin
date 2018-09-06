"			__     _____ __  __ ____   ____
"			\ \   / /_ _|  \/  |  _ \ / ___|
"			 \ \ / / | || |\/| | |_) | |
"			  \ V /  | || |  | |  _ <| |___
"			   \_/  |___|_|  |_|_| \_\\____| By yang.zisong
"实用设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 关闭vi的一致性模式，避免以前版本的一些Bug和局限
set nocompatible
set backspace=indent,eol,start
"共享剪贴板
set clipboard+=unnamed
" 修改文自动备份
set nobackup
"文件在Vim之外修改过，自动重新读入"
set autoread
"设置自动保存内容"
set autowrite
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 编码格式设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,chinese
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 基本设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 设置tab宽度
set tabstop=4
" 设置自动对齐空格数
set shiftwidth=4
" 历史记录数
set history=1000
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 显示设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 用浅色高亮当前行
set cursorline
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
set hlsearch
set incsearch
" 设置搜索时忽略大小写
set ignorecase
" 当搜索的时候尝试smart
set smartcase
" 高亮结尾空格
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"ctags设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"按照名称排序
let Tlist_Sort_Type = "name"
" 压缩方式
let Tlist_Compart_Format = 1
" 不要显示折叠树
let Tlist_Enable_Fold_Column =0
"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File=1
"设置自动打开ctags
let Tlist_Auto_Open=0
"在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window = 1
" 当只剩下Tlist的时候自动关闭
let Tlist_Exit_OnlyWindow=1
" 自动更新TagList包含最新编辑的文件
let Tlist_Auto_Update=1
" 打开tags用单击
let Tlist_Use_SingleClick=1
"设置tags
set tags=tags;
set autochdir
"设定系统中ctags程序的位置
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"NERDTree设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"只剩下目录树时则自动关闭目录树
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"新文件标题设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,sh,.Java文件，自动插入文件头
autocmd BufNewFile *.py,*.cpp,*.[ch],*.sh,*.Java exec ":call SetTitle()"
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
	"其他类型文件
	else
		call setline(1, "/*************************************************************************")
		call append(line("."), "	> File Name: ".expand("%"))
		call append(line(".")+1, "	> Author:yang.zisong ")
		call append(line(".")+2, "	> Mail: zisongyang168@163.com")
		call append(line(".")+3, "	> Created Time: ".strftime("%c"))
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 键盘设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagslist开启关闭快捷键
map <F2> :TlistToggle<CR>
"NERDTree开启关闭快捷键
map <F3> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
