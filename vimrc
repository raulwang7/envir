" 檔案編碼
set encoding=utf-8
set fileencodings=utf-8,cp950

" 編輯喜好設定
behave mswin
syntax on        " 語法上色顯示
filetype on
filetype indent plugin on

colorscheme torte
"au GUIEnter * simalt ~x
set nu						" 顯示行數
set nocompatible			" VIM 不使用和 VI 相容的模式
"set ai					" 自動縮排
set cindent
set shiftwidth=4			" 設定縮排寬度 = 4
set tabstop=4			" tab 的字元數
set softtabstop=4
"set expandtab				" 用 space 代替 tab
set autoindent              " same level indent
set ruler					" 顯示右下角設定值
set backspace=2				" 在 insert 也可用 backspace
set ic						" 設定搜尋忽略大小寫
set ru						" 第幾行第幾個字
set hlsearch				" 設定高亮度顯示搜尋結果
set incsearch				" 在關鍵字還沒完全輸入完畢前就顯示結果
set smartindent				" 設定 smartindent
set confirm					" 操作過程有衝突時，以明確的文字來詢問
set history=100				" 保留 100 個使用過的指令
set cursorline				" 顯示目前的游標位置
set cursorcolumn
set mousehide				" 當輸入文字時隱藏 mouse
set guioptions-=T			" remove toolbar
"set guioptions-=r			" remove right-hand scroll bar
set showmatch				" 設置匹配模式，顯示匹配的括号
set whichwrap=b,s,<,>,[,]	" 光標從行首和行末时可以跳到另一行去
set nobackup                " no auto backup
set foldmethod=syntax       " 自動摺疊

" ctags & taglist setting
set tags=PATH/tags
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=1
let Tlist_Auto_Update=1
"let Tlist_Use_SingleClick=1

" map
nnoremap <F3>  :NERDTreeToggle<CR>
nnoremap <F5>  :noh<CR>
nnoremap <F12> :TlistToggle<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <S-e> :w<CR>:!python % <CR>
"nnoremap <buffer> <S-e> :w<CR>:!python % <CR>
nnoremap gf    :tabedit <cfile><CR>

" Remove tailing spaces
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * :%s/\s\+$//e

" Vim 自動回到檔案最後讀取位置
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

" set statusline
set laststatus=2
set statusline=%y\ %t\%r%h%w\ %m%=\ %{&fileencoding}\ [%{&ff}]\ [AscII=\%03.3b]\ [Hex=\%02.2B]\ [LINE=%L]\ [Pos=%l,%v,%p%%]

" auto reload vimrc whenever change
autocmd! bufwritepost .vimrc source %

" cross cursor
"hi CursorLine   cterm=NONE ctermbg=235
"hi CursorColumn cterm=NONE ctermbg=235
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" cursor config
highlight Cursor guifg=white guibg=blue
highlight iCursor guifg=white guibg=steelblue

augroup CursorLine
	au!
  	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  	au WinLeave * setlocal nocursorline
augroup END

