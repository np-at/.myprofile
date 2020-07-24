set encoding=utf-8

set nocompatible              " be iMproved, required
filetype off                  " required
" set termguicolors
syn on
" filetype on

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
" call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('$HOME/.vim/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'jiangmiao/auto-pairs'
Plugin 'w0rp/ale'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'mileszs/ack.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/mayansmoke'
Plugin 'scrooloose/nerdtree'
Plugin 'chr4/nginx.vim'
Plugin 'amix/open_file_under_cursor.vim'
Plugin 'vim-scripts/tlib'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'sophacles/vim-bundle-mako'
Plugin 'kchmck/vim-coffee-script'
Plugin 'altercation/vim-colors-solarized'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'groenewege/vim-less'
Plugin 'therubymug/vim-pyte'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/goyo.vim'
Plugin 'amix/vim-zenroom2'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'morhetz/gruvbox'
Plugin 'nvie/vim-flake8'
Plugin 'digitaltoad/vim-pug'
Plugin 'itchyny/lightline.vim'
Plugin 'maximbaz/lightline-ale'
Plugin 'tpope/tpope-vim-abolish'
Plugin 'rust-lang/rust.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'mattn/vim-gist'
Plugin 'vim-ruby/vim-ruby'
Plugin 'leafgarland/typescript-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'PProvost/vim-ps1'

Plugin 'rafi/awesome-vim-colorschemes'

Plugin 'sainnhe/vim-color-forest-night'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.

" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}


" color schemes
" Plugin 'rafi/awesome-vim-colorschemes'


" You Complete Me
Plugin 'ycm-core/YouCompleteMe'


"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

set omnifunc=syntaxcomplete#Complete

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" set runtimepath+=~/.vim_runtime

 source ~/.myprofile/basic.vim
 source ~/.myprofile/filetypes.vim
 source ~/.myprofile/plugins_config.vim
 source ~/.myprofile/extended.vim

try
        source ~/.vim_runtime/my_configs.vim
catch
endtry

" set term=screen-256color
if !has('nvim')
    set ttymouse=xterm2
endif

set mouse=a
set number
" the configuration options should be placed before `colorscheme forest-night`

"let g:forest_night_enable_italic = 1
" let g:forest_night_disable_italic_comment = 1

colorscheme afterglow

" set background=dark

" set t_CO=256
