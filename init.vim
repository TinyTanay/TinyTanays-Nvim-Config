"Tanay's nvim config!**


"Plugins**

call plug#begin (stdpath('data') . '/plugged')
Plug 'glepnir/dashboard-nvim'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi-vim'
Plug 'andweeb/presence.nvim'
call plug#end()


"Maps**

nnoremap a :term<CR>

"Better bracket pair completion deletion**

let g:couples = ['(#)', '[#]', "'#'", '"#"', '{#}']
function! BetterBS()

    for l:couple in g:couples
        if ! (l:couple =~ '#')
            continue
        endif
        let l:regex = substitute(escape(l:couple, '/\^$*.[~'), '#', '\\%#', '')
        if search(l:regex, 'n')
            let l:out = repeat("\<BS>", len(matchstr(l:couple, '^.\{-}\ze#')))
            let l:out .= repeat("\<DEL>", len(matchstr(l:couple, '#\zs.\{-}$')))
            return l:out
        endif
    endfor

    return "\<BS>"
endfunction
inoremap <silent> <BS> <C-r>=BetterBS()<CR>


"General Configs**

lua<<EOF
require'nvim-tree'.setup()
EOF
nnoremap <silent> :Files<CR>
let g:dashboard_default_executive = 'fzf'
set termguicolors
colo nord
let g:jedi#completions_enabled = 1
let g:deoplete#enable_at_startup = 1


"NerdTree Configs**

nnoremap m :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
