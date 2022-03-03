<<<<<<< HEAD:.config/nvim/init.vim
" This is my personal Nvim configuration supporting Mac, Linux and Windows, with various plugins configured.
" This configuration evolves as I learn more about Nvim and become more proficient in using Nvim.
" Since it is very long (more than 1000 lines!), you should read it carefully and take only the settings that suit you.
" I would not recommend cloning this repo and replace your own config. Good configurations are personal,
" built over time with a lot of polish.
"
" Author: Jie-dong Hao
" Email: jdhao@hotmail.com
" Blog: https://jdhao.github.io/

let s:core_conf_files = [
      \ 'globals.vim',
      \ 'options.vim',
      \ 'autocommands.vim',
      \ 'mappings.vim',
      \ 'plugins.vim',
      \ 'themes.vim'
      \ ]

for s:fname in s:core_conf_files
  execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor
=======
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" File tree explorer (:NERDTree)
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plugin for quick commenting
Plug 'tpope/vim-commentary'

" Enables signals for line additions, deletions, changes
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" Vim themes
" Plug 'overcache/NeoSolarized'
" Plug 'mhartington/oceanic-next' 
Plug 'kyoz/purify', { 'rtp': 'vim' }

" Fancy syntax highlighting for various languages
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Vim trouble plugin for troubleshooting problems 
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'folke/lsp-colors.nvim'

" Enable preview when editing markdown files (:MarkdownPreview)
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Awesome airline banners
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Telescope finder, grepper, etc.
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Fancy developer icons
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

set number
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set encoding=UTF-8

let g:airline_solarized_bg='dark'
" let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1

" For oceanic-next theme
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
" colorscheme OceanicNext
colorscheme purify
" colorscheme NeoSolarized 
set background=dark

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <F2> :NERDTreeToggle<CR>

" Add macro for reloading init.vim
nnoremap <leader>sv :source $MYVIMRC<CR>

lua << EOF
  require("trouble").setup {}
EOF

" Vim Script
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
>>>>>>> 28d2583716fd290e200ea3e8cc2f8d21c31c559c:.config/nvim-backup/init.vim
