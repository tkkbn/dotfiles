" スクロール
" noremap <Space>j <C-f>
" noremap <Space>k <C-b>

" The prefix key.
nnoremap [Tag] <Nop>
nmap <Space> [Tag]
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
" for n in range(1, 9)
"   execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
" endfor

" tabline
map <silent> [Tag]t :tablast <bar> tabnew <bar> Explore <bar> vs<CR>
map <silent> [Tag]w :tabclose<CR>
map <silent> [Tag]p :tabnext<CR>
map <silent> [Tag]o :tabprevious<CR>

" ウィンドウ切り替え
" nnoremap [Tag]h <C-w>h
" nnoremap [Tag]l <C-w>l

" Explore
nnoremap <silent> ;e :<C-u>Explore<CR>

" End Vim
nnoremap <silent> ;xc :qa!<CR>

" Unite.vim
nnoremap <silent> ;u :<C-u>Unite buffer git_files<CR>
imap ;q <C-u><C-h>

" ctags
nnoremap <silent> [Tag]d <C-]>
"nnoremap <silent> [Tag]d :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
nnoremap <silent> [Tag]f g<C-]>
nnoremap <silent> [Tag]u <C-o>
nnoremap <silent> [Tag]i <C-i>

" Hash Rocket
command! -bar -range=% NotRocket :<line1>,<line2>s/:\([a-z_]\+\)\s*=>/\1:/g
vnoremap <silent> gr :NotRocket<CR>

" Source .vimrc
noremap <silent> ;s :<C-u>source<Space>~/.vimrc<CR>

" Cursor in command line
cmap <C-f> <Right>
cmap <C-b> <Left>

" paste
nnoremap gp :<C-u>r !pbpaste<CR>

" delete highlight
nnoremap <silent> gh :let @/=''<CR>

" Git Blame
nnoremap <silent> gb :<C-u>Gblame<CR>

" Golang
noremap <silent> ;t :!go test .<CR>
noremap <silent> ;r :!go run %<CR>

" break undo chain when using insert mode deletions (:h i_CTRL-G_u)
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

" pane size changer
nnoremap <C-w>> <C-w>14>
nnoremap <C-w>< <C-w>14<

" binding.pry
inoremap <C-v> require "pry"; binding.pry