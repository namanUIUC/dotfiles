set nocompatible              " be iMproved, required
set shell=/bin/bash
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let vundle manage vundle
Plugin 'gmarik/vundle'

" list all plugins
"[1] Fuzzy file finder
Plugin 'kien/ctrlp.vim'
"[2] File drawer
Plugin 'scrooloose/nerdtree'
"[3] Timux interaction
Plugin 'benmills/vimux'
"[4] Git helper ultimate
Plugin 'tpope/vim-fugitive' " the ultimate git helper
"[5] Powerline bar - airline
Plugin 'vim-airline/vim-airline'
"[6] Airline themes
Plugin 'vim-airline/vim-airline-themes'
"[7] Nord vim color scheme
Plugin 'arcticicestudio/nord-vim'
"[8] Git gutter - compatible with airline
Plugin 'airblade/vim-gitgutter'
"[9] To catch the word and change the surronding
Plugin 'tpope/vim-surround'
"[10] Pep8 compatibility
Plugin 'tell-k/vim-autopep8'
"[11] Python folding
Plugin 'tmhedberg/SimpylFold'

call vundle#end()
filetype plugin indent on

set paste
set pastetoggle=<F6>
set rnu
set number
set t_Co=256            "set colors to 256
syntax enable           "use syntax highlighting
colorscheme nord

"MAPPINGS
map <F1> :bprev<CR>
map <F2> :bnext<CR>
map <F3> :PluginInstall<CR>
map <F4> :noh<CR>
map <F5> :source ~/.vimrc<CR>

let g:NERDTreeNodeDelimiter = "\u00a0"

" Visual Delimiter
highlight ColorColumn ctermbg=cyan
call matchadd('colorColumn','\%81v',100)

"Allow usage of mouse in iTerm
set ttyfast
set mouse=a

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

"Air-line
let g:airline_theme='base16'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

hi SpellBad ctermfg=255 ctermbg=052 guifg=#eeeeee guibg=#5f0000
hi SpellCap ctermfg=255 ctermbg=053 guifg=#eeeeee guibg=#5f005f

set expandtab
set shiftwidth=4
"let g:nord_comment_brightness = 20
"let g:nord_cursor_line_number_background = 1

"make searching better
"set gdefault      " Never have to type /g at the end of search / replace again
"set ignorecase    " case insensitive searching (unless specified)
"set smartcase
"set hlsearch
"set incsearch
"set showmatch

"Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

set splitbelow
set splitright

" Key mappings

        " Set Leader to Space
                let mapleader = "\<Space>"

        "clear the hishlighted text after search
                nnoremap <leader>n :NERDTreeToggle<cr>
        " tab stuff
                nnoremap tn :tabnew<cr>
                nnoremap tk :tabnext<cr>
                nnoremap tj :tabprev<cr>
                nnoremap th :tabfirst<cr>
                nnoremap tl :tablast<cr>

        " space-s to save and space-w save (readonly)
                nnoremap <leader>s :w<cr>
                nnoremap <leader>q :q!<cr>
                nnoremap <leader>w :w !sudo tee %  > /dev/null<cr>
                
" Commenting
        
        " space-1 insert "!" commenting
                nnoremap <leader>1 :norm i!<cr>
                vnoremap <leader>1 :norm i!<cr>

        " space-' insert """ commenting
                nnoremap <leader>' :norm i"<cr>
                vnoremap <leader>' :norm i"<cr>

        " space-3 insert "#" commenting
                nnoremap <leader>/ :norm i#<cr>
                vnoremap <leader>/ :norm i#<cr>

        " space-- insert "--" commenting
                nnoremap <leader>- :norm i--<cr>
                vnoremap <leader>- :norm i--<cr>

        " space-6 uncomment
                nnoremap <leader>. :norm ^x<cr>
                vnoremap <leader>. :norm ^x<cr>

        " edit config files
                nnoremap <leader>ez :tabnew ~/.zshrc<cr>
        
        " retab shortcut
                nnoremap <leader>r :retab<cr>


" Convenience
        nmap G Gzz
        nmap n nzz
        nmap N Nzz
        map <Enter> o<ESC>
        map <S-Enter> O<ESC>

" Quick pairs
        imap <leader>' ''<ESC>i
        imap <leader>" ""<ESC>i
        imap <leader>( ()<ESC>i
        imap <leader>[ {}<ESC>i

"" resize window CTRL+(up|down|left|right)
"        nnoremap <C-u> :resize +1<CR>
"        nnoremap <C-i> :resize -1<CR>
"        nnoremap <C-U> :vertical resize -1<CR>
"        nnoremap <C-I> :vertical resize +1<CR>

" toggle between split screens
        nnoremap <C-J> <C-W><C-J>
        nnoremap <C-K> <C-W><C-K>
        nnoremap <C-L> <C-W><C-L>
        nnoremap <C-H> <C-W><C-H>

map <leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Runung the current python file
map <leader>z :call VimuxRunCommand("clear; python3 " . bufname("%"))<CR>

" comvert file according to pep8
map <leader>x :call Autopep8()<cr>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:neoformat_python_autopep8 = {
            \ 'exe': 'autopep8',
            \ 'args': ['-s 4', '-E'],
            \ 'replace': 1,
            \ 'stdin': 1,
            \ 'env': ["DEBUG=1"],
            \ 'valid_exit_codes': [0, 23],
            \ 'no_append': 1,
            \ }

let g:neoformat_enabled_python = ['autopep8']
