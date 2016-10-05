" Open ViM in non-Vi-compatible mode. Needed for all the ViM goodness!
" Note: This changes other settings, so MUST be at the top.
set nocompatible


" Pathogen -------------------------------------------------- "
" Pathogen normally should be in ~/.vim/autoload, however this
" lets us manage it as a git submodule like everything else.
runtime bundle/vim-pathogen/autoload/pathogen.vim
" this is what causes all plugins in bundle/ dir to be loaded.
execute pathogen#infect()


" vim-airline ----------------------------------------------- "
" A plugin that customizes the status bar
"
" required to make the custom status bar appear by default.
set laststatus=2

" Use fancy powerline font symbols
" Note: must change gnome-terminal profile preferences to a custom powerline font.
"       Preferably use gnome-tweak-tool and change the default mono font.
let g:airline_powerline_fonts=1
let g:airline_theme='hybridline'
let g:Powerline_symbols='fancy'

" Powerline defaults
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

" Remove hunks from gitgutter statusline
" let g:airline_section_b=%{airline#util#wrap(airline#extensions#hunks#get_hunks(),0)}%{airline#util#wrap(airline#extensions#branch#get_head(),0)}
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)}'


" General settings ------------------------------------------ "
set autoindent                " Turn on auto indenting
set encoding=utf-8            " Handle Unicode files
set ttimeout                  " Enable timeout for commands
set ttimeoutlen=100           " Do not wait too long for command completion
set lazyredraw		            " Don't update the display while executing macros
set wildmode=longest,list     " Set command-line completion to behave like bash
set incsearch                 " Highlight and jump to incomplete search results
"set scrolloff=1              " Show at least one line above/below the cursor
"set sidescrolloff=5          " Show at least five cols horizontally scrolling
set gdefault                  " Make substitutions default to global
set ruler                     " show the cursor position all the time
set updatetime=300            " set update time (used by many things like gitgutter)
set completeopt=menu,longest  " http://vim.wikia.com/wiki/VimTip1386
                              " and http://stackoverflow.com/a/35327796/655809


" Whitespace settings --------------------------------------- "
" Tab (2 spaces)
set tabstop=2                   " width of a tab character
set softtabstop=2
set shiftwidth=2
set expandtab     	            " Insert spaces for tab
" Toggle visibility of whitespace characters with <leader>-l
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬     " Invisible characters config


" Files ----------------------------------------------------- "
"
" Filetype stuff
filetype on        " Detect filetype
filetype plugin on " Load plugin for filetype
filetype indent on " Enable indenting for filetype

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" Drupal *.module and *.install files.
augroup drupal
  autocmd BufRead,BufNewFile *.module set filetype=php
  autocmd BufRead,BufNewFile *.install set filetype=php
augroup END

autocmd BufNewFile,BufRead *.ejs set filetype=html.js
autocmd BufNewFile,BufRead *.jst set filetype=html.js
autocmd BufNewFile,BufRead *.handlebars set filetype=html.js
autocmd BufNewFile,BufRead *.hbs set filetype=html.js
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead {Guardfile,Gemfile,Rakefile,Vagrantfile} set filetype=ruby
autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" File type-specific whitespace settings
" Syntax of these languages is fussy over tabs Vs spaces
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType python setlocal sw=4 ts=4 sts=4 expandtab
"autocmd FileType python setlocal shiftround
"autocmd FileType python setlocal autoindent
autocmd FileType python setlocal textwidth=79
autocmd FileType cpp setlocal sw=4 ts=4 sts=4 expandtab
autocmd FileType ruby setlocal sw=2 ts=2 sts=2 expandtab

" Automatically source .vimrc file when saved
augroup myvimrc
  au!
  au BufWritePost .vimrc so $MYVIMRC
augroup END

" Files to ignore on autocomplete
set  wildignore=*.bin,*/build/*,*.dat,*.jpg,*.o,*.out,*.orig,*.pdf,*.png,*.pyc,*.so,*.swp

" set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set noswapfile " no swap files

" Netrw
let g:netrw_list_hide= '.*\.sw(p|o),.*\.pyc$'


" Syntax highlighting --------------------------------------- "
syntax on                   " Turn on syntax highlighting
set t_Co=256                " Set proper colors for terminal vim
colorscheme default
"colorscheme molokai
"let g:molokai_original = 1

"highlight NonText guifg=#272727
"highlight SpecialKey guifg=#272727
hi SpellBad ctermfg=015 ctermbg=009 guifg=#ff0000 guibg=#5f0000
hi SpellCap ctermfg=000 ctermbg=011 guifg=#ff0000 guibg=#ffff00

" change the highlight color for search hits and quickfix
hi Search cterm=NONE ctermfg=black ctermbg=grey

" Gutters --------------------------------------------------- "
"
set number                            " show line numbers in the left gutter
" hi SignColumn ctermbg=236
hi clear SignColumn
set cc=90                             " Column to highlight to indicate max line length
hi ColorColumn ctermbg=236
set cursorline                        " highlight the current line
hi CursorLine cterm=NONE ctermbg=235

" Git gutter
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '+-'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_modified_removed = '-+'


" Keymaps --------------------------------------------------- "
let g:mapleader = '\'                   " <leader>
nnoremap <Leader>n :Explore<CR>

" http://vimcasts.org/episodes/indentation-commands/
" TextMate's key mappings for indentation
"nmap <C-[> <<
"nmap <C-]> >>
"vmap <C-[> <gv
"vmap <C-]> >gv

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

" Shortcut for pasting from system clipboard with proper formatting
map <Leader>p :set paste<CR>i<C-V><esc>:set nopaste<cr>
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"

" Window management
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Expand current file directory (http://vimcasts.org/episodes/the-edit-command/)
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Jump to next error
" :cn , :cp , :cc
" :lne , :lp


" Plugins --------------------------------------------------- "
"
" DelimitMate
let loaded_delimitMate = 1 " Disable DelimitMate cause it can be annoying

" Syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_php_checkers = ['']
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['pp', 'js', 'css', 'html', 'xml', 'rb', 'json', 'yaml', 'yml'],
                           \ 'passive_filetypes': ['java', 'python', 'php'] }

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++14' " -stdlib=libc++'
let g:syntastic_enable_js_checker = 1

" Use the location list when errors occur
let g:syntastic_always_populate_loc_list = 1
" Do not show the location list when there are syntax errors
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0

" UltiSnips --------------------------------------------------------------------- "
"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Enable matchit
"runtime macros/matchit.vim

" Remember last cursor location
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

"Toggle relative numbering, and set to absolute on loss of focus or insert mode
set nonu
set rnu
function! ToggleNumbersOn()
  set nu!
  set rnu
endfunction
function! ToggleRelativeOn()
  set rnu!
  set nu
endfunction
" autocmd FocusLost * call ToggleRelativeOn()
" autocmd FocusGained * call ToggleRelajjjtiveOn()
" autocmd InsertEnter * call ToggleRelativeOn()
" autocmd InsertLeave * call ToggleRelativeOn()
au FocusLost,InsertLeave * setlocal rnu
au FocusLost,InsertLeave * setlocal nonu
au FocusGained,InsertEnter * setlocal nu
au FocusGained,InsertEnter * setlocal nornu
