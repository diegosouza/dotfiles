set nocompatible
filetype off

" Vundle para gerenciar os bundles
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" set leader key to comma
let mapleader = ","

Bundle 'airblade/vim-gitgutter'
Bundle 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode='' "Pesquisa a partir do diretório atual no Vim.
let g:ctrlp_match_window = 'max:20,results:20'

Bundle 'aquach/vim-http-client'
let g:http_client_result_vsplit = 0

Bundle 'scrooloose/syntastic'
Bundle 'maciakl/vim-neatstatus'
Bundle 'mileszs/ack.vim'
Bundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

syntax enable       " Habilita a marcação de sintaxe
set encoding=utf-8

set foldmethod=manual

set showmode        " Exibe o modo atual
set wildmenu        " Menu com as opções do vim usando tab
set background=dark " Define o fundo preto (É melhor usar isso com a sintaxe)
set nu              " Mostra o número de linhas
set ai              " Faz o auto tab/auto indent
set undolevels=1000 " Número de passos a desfazer
set ts=4            " tab vale 4 espaços
set sw=4            " tab com 4 espaços
set softtabstop=4   " Operações como o backspace também com 4 espaços
set et              " Troca tabs por espaços
set ruler           " Mostra a posição do cursor
set cursorline      " Destaca a linha atual
set laststatus=2    " Sempre exibe a barra de status

set autoread        " Recarrega arquivos alterados em disco automaticamente

set incsearch       " Pesquisa incremental
set hlsearch        " Highligth search :)
set ignorecase      " Pesquisa ignora caixa alta e baixa
set smartcase       " Pesquisa considera caixa alta apenas se ouver uma ou mais maiúsculas na pesquisa
set lazyredraw      " alivia lentidão ao navegar e renderizar a tela

autocmd FileType ruby,eruby set ts=2|set sw=2|set sts=2
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

:filetype plugin on
:filetype plugin indent on


Bundle 'spf13/vim-colors'
Bundle 'diegosouza/tomorrow-theme'
Bundle 'baskerville/bubblegum'

colorscheme Tomorrow-Night-Bright
