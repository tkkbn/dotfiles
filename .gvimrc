" Window size
set lines=68
set columns=174

" colorscheme
colorscheme molokai

set background=dark
set transparency=3
set guioptions-=R
set guioptions-=r
set guioptions-=L
set guioptions-=l

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/