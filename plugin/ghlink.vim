" ghlink
" Author: cat2koban
" License: MIT

if exists('g:loaded_ghlink')
  finish
endif
let g:loaded_ghlink = 1

let s:save_cpo = &cpo
set cpo&vim

command! -range=% Ghlink :call ghlink#build_url(<line1>, <line2>)

let &cpo = s:save_cpo
unlet s:save_cpo
