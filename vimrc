execute pathogen#infect()
filetype plugin indent on
syntax enable
set background=dark
set expandtab
set tabstop=2 shiftwidth=2 expandtab
set backspace=indent,eol,start
let mapleader = "-"
let g:solarized_visibility="normal"
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
let g:vim_markdown_folding_disabled = 1
let g:rspec_runner = "os_x_iterm2"
let g:gtm_plugin_status_enabled = 1
" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>r :Rake test<CR>

