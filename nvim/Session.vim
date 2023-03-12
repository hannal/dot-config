let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 .stylua.toml
badd +1 lua/josean/core/keymaps.lua
badd +31 init.lua
badd +1 lua/josean/plugins/lsp/lspconfig.lua
badd +18 lua/josean/plugins/treesitter.lua
badd +20 lua/josean/plugins/telescope.lua
badd +45 lua/josean/plugins/lsp/lspsaga.lua
badd +48 lua/josean/core/options.lua
badd +26 lua/josean/core/colorscheme.lua
badd +35 lua/josean/plugins/lualine.lua
badd +60 plugin/packer_compiled.lua
badd +1 lua/josean/plugins-setup.lua
badd +1 lua/josean/plugins/bufferline.lua
badd +2 lua/josean/plugins/comment.lua
badd +2 lua/josean/plugins/scope.lua
badd +38 lua/josean/plugins/nvim-tree.lua
badd +12 lua/josean/plugins/autopairs.lua
badd +0 ~/.config/nvim
badd +0 lua/hannal/core/keymaps.lua
badd +0 lua/hannal/plugins/lsp/lspconfig.lua
badd +0 lua/hannal/core/options.lua
argglobal
%argdel
$argadd ~/.config/nvim
edit lua/hannal/core/keymaps.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
4wincmd h
wincmd w
wincmd w
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 48 + 197) / 395)
exe 'vert 2resize ' . ((&columns * 86 + 197) / 395)
exe 'vert 3resize ' . ((&columns * 86 + 197) / 395)
exe 'vert 4resize ' . ((&columns * 86 + 197) / 395)
exe 'vert 5resize ' . ((&columns * 85 + 197) / 395)
argglobal
enew
file NvimTree_1
balt init.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
lcd ~/.config/nvim
wincmd w
argglobal
balt ~/.config/nvim/lua/josean/plugins/lsp/lspconfig.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 2 - ((1 * winheight(0) + 41) / 82)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2
normal! 0
lcd ~/.config/nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim/lua/hannal/plugins/lsp/lspconfig.lua", ":p")) | buffer ~/.config/nvim/lua/hannal/plugins/lsp/lspconfig.lua | else | edit ~/.config/nvim/lua/hannal/plugins/lsp/lspconfig.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/hannal/plugins/lsp/lspconfig.lua
endif
balt ~/.config/nvim/lua/josean/plugins/bufferline.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 2 - ((1 * winheight(0) + 41) / 82)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2
normal! 0
lcd ~/.config/nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim/lua/hannal/core/options.lua", ":p")) | buffer ~/.config/nvim/lua/hannal/core/options.lua | else | edit ~/.config/nvim/lua/hannal/core/options.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/hannal/core/options.lua
endif
balt ~/.config/nvim/lua/josean/core/keymaps.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 31 - ((30 * winheight(0) + 41) / 82)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 31
normal! 0
lcd ~/.config/nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim/init.lua", ":p")) | buffer ~/.config/nvim/init.lua | else | edit ~/.config/nvim/init.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/init.lua
endif
balt ~/.config/nvim/lua/josean/plugins/telescope.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 31 - ((30 * winheight(0) + 41) / 83)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 31
normal! 03|
lcd ~/.config/nvim
wincmd w
4wincmd w
exe 'vert 1resize ' . ((&columns * 48 + 197) / 395)
exe 'vert 2resize ' . ((&columns * 86 + 197) / 395)
exe 'vert 3resize ' . ((&columns * 86 + 197) / 395)
exe 'vert 4resize ' . ((&columns * 86 + 197) / 395)
exe 'vert 5resize ' . ((&columns * 85 + 197) / 395)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
