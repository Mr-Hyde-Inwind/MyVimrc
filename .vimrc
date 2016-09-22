"显示行号
set nu

let mapleader=";"

"设置tab
set ts=4
set expandtab
set shiftwidth=4
set softtabstop=4

set showmatch

set matchtime=5

vnoremap <Leader>y "+y

vnoremap <Leader>p "+p

nmap <Leader>q :q<CR>

nmap <Leader>w :w<CR>

nmap <Leader>W :wq<CR>

nmap <Leader>Q :qa!<CR>


"自动缩进
set autoindent

filetype on

syntax on

set background=dark

"C++ compile and run


func SetTitle()
    if &filetype == 'python'
        call setline(1,"'''")
        call append(line("."),"************************************")
        call append(line(".")+1,"    File Name: ".expand("%"))
        call append(line(".")+2,"    Create Time: ".strftime("%y-%m-%d %H:%M:%S"))
        call append(line(".")+3,"    Author: Hermit")
        call append(line(".")+4,"    Mail: LasNoire23@gmail.com")
        call append(line(".")+5,"************************************")
        call append(line(".")+6,"'''")
    else
        call setline(1,"/*************************************")
        call append(line("."),"    File Name: ".expand("%"))
        call append(line(".")+1,"    Create Time: ".strftime("%y-%m-%d %H:%M:%S"))
        call append(line(".")+2,"    Author: Hermit")
        call append(line(".")+3,"    Mail: LasNoire23@gmail.com")
        call append(line(".")+4," *************************************/")
    endif 

    if &filetype == 'cpp'
        call append(line(".")+5,"#include<bits/stdc++.h>")
        call append(line(".")+6,"using namespace std;")
    endif
endfunc


autocmd BufNewFile *.cpp,*.py,*.java exec ":call SetTitle()"


map <F9> :call CompileRungpp()<CR>
map <F10> :call Run()<CR>

func Run()
    exec "w"
    exec "! %<"
endfunc

func CompileRungpp()
    exec "w"
    exec "!g++ % -o %<"
    exec "! %<"
endfunc

