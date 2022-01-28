" =========================
" 	      Plugin
" =========================

call plug#begin('~/.vim/plugged')

  Plug 'preservim/NERDTree'

  Plug 'sainnhe/gruvbox-material'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'hzchirs/vim-material'

  Plug 'itchyny/lightline.vim'

  Plug 'mengelbrecht/lightline-bufferline'

call plug#end()


" =========================
" =========================


" =========================
" 	    Basic Config
" =========================

set number
set expandtab			            "replace tabs with space
set tabstop=2 shiftwidth=2	  "1 tab = 2 spaces
set hlsearch			            "highlight search results (after pressing Enter)
set incsearch			            "highlight all pattern matches WHILE typing the pattern
set showmatch			            "show the mathing brackets
set cursorline			          "highlight current line
syntax on			                "syntax highlight on
set wrap                      "wrapping textline
set ignorecase                "Ignore capital letters during search
set scrolloff=3               "minimum lines to keep above and below cursor
set ruler                     "always show cursor position
set background=dark           "use colors that suit a dark background
set mouse=a                   "enable mouse to scroll and resize
set linebreak                 "avoid wrapping a line in the middle of word
set foldenable                "enable folding
set foldlevelstart=10         "open most folds by default
set foldnestmax=10            "10nestedfoldmax
set hidden                    "for improving coc plugin
set nobackup                  "for improving coc plugin
set nowritebackup             "for improving coc plugin
set updatetime=300            "default value 400ms
set laststatus=2              "showing vim lightline
set showtabline=2             "Show tabline
set guioptions-=e             "Don't use GUI tabline
" =========================
" =========================


" =========================
"       Plugin Conf
" =========================

" Colorscheme configuration

"colorscheme vim-material
"let g:material_style='palenight'
"set background=dark

colorscheme gruvbox-material
let g:gruvbox_material_background = 'hard'
"let g:gruvbox_material_enable_bold = 1        "enabled bold in function name
let g:gruvbox_material_cursor = 'yellow'      "customize cursor color


let g:lightline = {
\   'colorscheme': 'gruvbox_material',
\   'active': {
\    'left' :[[ 'mode', 'paste' ],
\             [ 'fugitive', 'readonly' ],
\             [ 'filename', 'modified' ]],
\    'right':[[ 'lineinfo' ],
\             [ 'percent' ],
\             [ 'filetype', 'fileencoding', 'fileformat' ]]
\   },
\   'component': {
\     'lineinfo': ' %3l:%-2v',
\     'filename': '%<%f'
\   },
\   'component_function': {
\     'fugitive': 'LightlineFugitive',
\     'readonly': 'LightlineReadonly',
\     'modified': 'LightlineModified',
\     'fileformat': 'LightlineFileformat',
\     'filetype': 'LightlineFiletype',
\   }
\}
let g:lightline.separator = {
\   'left': '', 'right': ''
\}
let g:lightline.subseparator = {
\   'left': '', 'right': ''
\}
let g:lightline.tabline = {
\   'left': [['buffers']],
\   'right': [['close']]
\}
let g:lightline.component_expand = {
\   'buffers': 'lightline#bufferline#buffers'
\}
let g:lightline.component_type = {
\   'buffers': 'tabsel'
\}

let g:lightline.tabline = {
\   'left': [ ['buffers'] ],
\   'right': [ ['close'] ]
\}

let g:lightline.tabline = {
\   'left': [ ['buffers'] ],
\   'right': [ ['string1'] ]
\}

let g:lightline.component_expand = {
\   'buffers': 'lightline#bufferline#buffers',
\   'string1': 'String1'
\}

function! String1()
  return 'Triple Twins Company'
endfunction

function! LightlineModified()
  return &modified ? '●' : ''
endfunction

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return fugitive#head()
endfunction

" autoreload
command! LightlineReload call LightlineReload()

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

" bufferline configuration
let g:lightline#bufferline#unnamed = "[NO NAME]"
let g:lightline#bufferline#filename_modifier= ":."
let g:lightline#bufferline#more_buffers = "..."
let g:lightline#bufferline#modified = " ●"
let g:lightline#bufferline#read_only = " "
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1


" ========================
" ========================

" =========================
"       KeyBinding
" =========================

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <space> za

" =========================
" =========================
