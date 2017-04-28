set nocompatible
filetype off

" Vundle para gerenciar os bundles
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required
Plugin 'Townk/vim-autoclose'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_working_path_mode='' "Pesquisa a partir do diretório atual no Vim.
let g:ctrlp_match_window = 'max:20,results:20'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|svn))$',
  \ 'file': '\v\.(so|class|gif|png|jpg|jpeg)$',
\}

Plugin 'vim-airline/vim-airline'
let g:airline_powerline_fonts=1
ret g:airline_detect_paste=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

Plugin 'w0rp/ale'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '>'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

Plugin 'spf13/vim-colors'
Plugin 'diegosouza/tomorrow-theme'
Plugin 'baskerville/bubblegum'
Plugin 'trevordmiller/nova-vim'

" set leader key to comma
let mapleader = ","

syntax enable       " Habilita a marcação de sintaxe
set encoding=utf-8

set foldmethod=manual

set showmode         " Exibe o modo atual
set wildmenu         " Menu com as opções do vim usando tab
set background=dark  " Define o fundo preto (É melhor usar isso com a sintaxe)
set nu               " Mostra o número de linhas
set ai               " Faz o auto tab/auto indent
set undolevels=10000 " Número de passos a desfazer
set ts=4             " tab vale 4 espaços
set sw=4             " tab com 4 espaços
set softtabstop=4    " Operações como o backspace também com 4 espaços
set et               " Troca tabs por espaços
set ruler            " Mostra a posição do cursor
set cursorline       " Destaca a linha atual
set laststatus=2     " Sempre exibe a barra de status

set autoread         " Recarrega arquivos alterados em disco automaticamente

set incsearch        " Pesquisa incremental
set hlsearch         " Highligth search :)
set ignorecase       " Pesquisa ignora caixa alta e baixa
set smartcase        " Pesquisa considera caixa alta apenas se ouver uma ou mais maiúsculas na pesquisa
set lazyredraw       " alivia lentidão ao navegar e renderizar a tela "

autocmd FileType ruby,eruby set ts=2|set sw=2|set sts=2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufWritePre * :%s/\s\+$//e " remove espaços no final das linhas

" Opções para que blocos selecionados sejam reselecionados após identações.
vnoremap < <gv
vnoremap > >gv

set clipboard=unnamedplus " integra com área de tranf. do sistema se VIM compilado com +xterm_clipboard

" clear the command line and search highlighting
noremap <C-l> :nohlsearch<CR>

" Salvar arquivo ao pressionar esc 2 vezes seguidas
map <Esc><Esc> :w<CR>

" atalho para nova aba, já que utilizo muito...
nmap <C-w>t :tabnew<CR>

" To open a new empty buffer
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin on
filetype plugin indent on

colorscheme nova
set t_Co=256
highlight Normal ctermbg=NONE
