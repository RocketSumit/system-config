" vim-plug
if has('win32')
  source $HOME/appdata/local/nvim/plugged.vim
else
  source $HOME/.config/nvim/plugged.vim
endif

" Python path
let g:python3_host_prog="$HOME/miniconda3/bin/python3"
let g:python_highlight_space_errors=0

"Easy Motion Configuration"
"map <Leader> <Plug>(easymotion-prefix)
"map f <Plug>(easymotion-bd-w)
let g:EasyMotion_use_upper=1
let g:EasyMotion_keys='SADFJKLEWCMPGH'
let g:Easymotion_smartcase=1
let g:EasyMotion_use_smartsign_us=1

" change the leader key from "\" to "," (";" is also popular)
let mapleader=","

" Maping shift-colon to just colon in normal mode"
nnoremap ; :
" Mapping L (end of line) to $ in normal mode
nnoremap L $

" Mouse support
set mouse=a

" Color theme
" If terminal background colour is different than uncomment the below line
set termguicolors
filetype plugin indent on
syntax on
colorscheme gruvbox
let g:gruvbox_invert_selection=0

" Identation
set expandtab shiftwidth=2 softtabstop=2 tabstop=4 textwidth=120
set modeline

" Fold method
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Line numbers
set number
"set relativenumber

" Highlight the current line
set cursorline

" Yes, the space exists
set list lcs=tab:\¦\

" To break long lines
set breakindent
set breakindentopt=shift:2
set showbreak=↳

" Set clipboard
set clipboard=unnamed

" ignores cases for search
set ignorecase

" Icons
let g:lightline#bufferline#enable_devicons = 1

" Copy to clipboard
vnoremap y "+y
nnoremap Y "+yg_
nnoremap y "+y
nnoremap yy "+yy

" Paste from clipboard
nnoremap P "+P
nnoremap p "+p
vnoremap P "+P
vnoremap p "+p

" To execute a macro over visual line selections
xnoremap Q :'<,'>:normal @q<CR>

" To replace stuff globally
set gdefault

" Using tab to move to right when inside brackets
" inoremap <expr> <Tab> search('\%#[]>)}]', 'n') ? '<Right>' : '<Tab>'

"#############################
" Plugin settings
"#############################

" Nerd Commenter
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=0 " Show hidden files in NerdTree buffer.

" Split windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Coc
let g:coc_global_extensions = [
      \'coc-word',
      \'coc-syntax',
      \'coc-spell-checker',
      \'coc-snippets',
      \'coc-prettier',
      \'coc-pairs',
      \'coc-lists',
      \'coc-highlight',
      \'coc-git',
      \'coc-emoji',
      \'coc-dictionary',
      \'coc-calc',
      \'coc-actions',
      \'coc-markdownlint',
      \'coc-json',
      \'coc-jedi',
      \'coc-docker',
      \'coc-clangd',
      \'coc-cmake',
      \'coc-yaml',
\]

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')
" Coc ends here finally }}}

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"


" Markdown preview
let g:mkdp_auto_close=0  

" Telescope file finder
nnoremap <leader>ff <cmd>Telescope find_files<cr>
