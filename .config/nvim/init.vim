let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader = " "

call plug#begin()

" latex
    Plug 'anufrievroman/vim-angry-reviewer'
    Plug 'anufrievroman/vim-tex-kawaii'
    Plug 'lervag/vimtex'

" syntax
    Plug 'juliaeditorsupport/julia-vim'
    Plug 'vim-python/python-syntax'
    Plug 'scrooloose/syntastic'
    Plug 'rust-lang/rust.vim'

" qol
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'tpope/vim-commentary'
    Plug 'scrooloose/syntastic'
    Plug 'jiangmiao/auto-pairs'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'wellle/targets.vim'
    Plug 'sirver/ultisnips'

" visuals
    Plug 'catppuccin/vim', { 'as': 'catppuccin' }
    Plug 'ryanoasis/vim-devicons'
    Plug 'itchyny/lightline.vim'
    Plug 'psliwka/vim-smoothie'

call plug#end()

" vimtex settings

let g:vimtex_view_method='zathura'
let g:vimtext_quickfix_mode=0
let g:tex_conceal='abdmg'
let g:tex_flavor='latex'
set conceallevel=1

" ultiSnips settings
let g:UltiSnipsSnippetDirectories=['~/.config/nvim/UltiSnips']
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsExpandTrigger='<tab>'

" vim-bookmarks settings
let g:bookmark_auto_close=1
let g:bookmark_sign='>>'

" coc settings
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
 
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" make enter accept suggestions
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" lightline settings
let g:lightline = { 'colorscheme': 'catppuccin_mocha' }
:colorscheme catppuccin_mocha

" angryreviewer settings
let g:AngryReviewerEnglish='british'

" nerdtree settings
let NERDTreeShowHidden=1
let NERDTreeIgnore=['~/.cache$[[path]]', '~/.clojure$[[path]]', '~/.gnupg$[[path]]', '~/.local$[[path]]', '~/.m2$[[path]]', '~/.mozilla$[[path]]', '~/.npm$[[path]]', '~/.spicetify$[[path]]', '~/.yarn$[[path]]', '~/Downloads$[[path]]', '~/memory:$[[path]]', '~/.bash_history$[[path]]', '~/.bash_logout$[[path]]', '~/.bash_profile$[[path]]', '~/.dmrc$[[path]]', '~/.git-credentials$[[path]]','\.pid$[[file]]', '~/.Xauthority$[[path]]', '~/.xsession-errors$[[path]]', '~/.xsession-errors.old$[[path]]', '~/.electron-gyp$[[path]]', '~/.git$[[path]]', '~/.gitlibs$[[path]]', '~/.pki$[[path]]']

set backspace=indent,eol,start
set undolevels=1000
set termguicolors
set shiftwidth=4
set laststatus=2
set smartindent
set splitbelow
set splitright
set ignorecase
set incsearch
set smartcase
set linebreak
set smarttab
set nospell
set number
set rnu nu
set hidden
set wrap

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>r :!cargo run --bin %:r
nnoremap <leader>ar :call AngryReviewer
autocmd VimEnter * NERDTree ~/
nnoremap <esc>^[ <esc>^[
map j gj
map k gk
