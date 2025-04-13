"设置配色，这里选择的是desert，也有其他方案，在vim中输入:color 在敲tab键可以查看
color vim
"设置背景色，每种配色有两种方案，一个light、一个dark
set background=light
"打开语法高亮
syntax on
"显示行号
set number
"设置缩进有三个取值cindent(c风格)、smartindent(智能模式，其实不觉得有什么智能)、autoindent(简单的与上一行保持一致)
set cindent
"在windows版本中vim的退格键模式默认与vi兼容，与我们的使用习惯不太符合，下边这条可以改过来
set backspace=indent,eol,start
"用空格键替换制表符
:set expandtab
"制表符占4个空格
set tabstop=4
"默认缩进4个空格大小
set shiftwidth=4
"增量式搜索
set incsearch
"高亮搜索
set hlsearch
"有时中文会显示乱码，用一下几条命令解决
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"set termencoding=utf-8
set encoding=utf-8
"很多插件都会要求的配置检测文件类型
:filetype on
:filetype plugin on
:filetype indent on
