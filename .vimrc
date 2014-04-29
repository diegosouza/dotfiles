set nocompatible
filetype off

" Vundle para gerenciar os bundles
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'airblade/vim-gitgutter'

Bundle 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode='' "Pesquisa a partir do diretório atual no Vim. 
let g:ctrlp_extensions = ['tag']
let g:ctrlp_match_window = 'max:20,results:20'

Bundle 'scrooloose/syntastic'
Bundle 'maciakl/vim-neatstatus'
Bundle 'mileszs/ack.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

syntax enable       " Habilita a marcação de sintaxe
set encoding=utf-8
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

" Opções para que blocos selecionados sejam reselecionados após identações.
vnoremap < <gv
vnoremap > >gv

" set leader key to comma
let mapleader = ","

" clear the command line and search highlighting 
noremap <C-l> :nohlsearch<CR> 
 
" Salvar arquivo ao pressionar esc 2 vezes seguidas
map <Esc><Esc> :w<CR> 

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !clear
  if match(a:filename, '\.feature$') != -1
    exec ":!bundle exec cucumber " . a:filename
  elseif match(a:filename, '_test\.rb$') != -1
    if filereadable("bin/testrb")
      exec ":!bin/testrb " . a:filename
    else
      exec ":!ruby -Itest " . a:filename
    end
  else
    if filereadable("Gemfile")
      exec ":!bundle exec rspec --color " . a:filename
    else
      exec ":!rspec --color " . a:filename
    end
  end
endfunction

function! SetTestFile()
  " set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

" run test runner
map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>


:filetype plugin on
:filetype plugin indent on


Bundle 'spf13/vim-colors'
Bundle 'diegosouza/tomorrow-theme'
Bundle 'baskerville/bubblegum'

colorscheme Tomorrow-Night-Bright
