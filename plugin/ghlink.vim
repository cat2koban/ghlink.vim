" 2~5 一回しか読み込まない
if exists('g:loaded_ghlink')
  finish
endif
let g:loaded_ghlink = 1

let s:save_cpo = &cpo
set cpo&vim

" command! 上書き
" command 定義
" 第二引数 -range=% 範囲選択
" count: 何行, line1,2: 始端, 終端
" q-args: コマンドに渡すオプション
command! -range=% Ghlink :call ghlink#build_url(<line1>, <line2>)

let &cpo = s:save_cpo
unlet s:save_cpo
