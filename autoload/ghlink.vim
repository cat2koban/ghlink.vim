" global scope
" g: これもグローバルスコープ、これは変数につく
function! ghlink#build_url()
  let anchor = "L10-L16"
  return "https://github.com/".s:extract_github_organization()."/blob/".s:current_git_hash()."/".s:current_git_path()."#".anchor
endfunction

" s: スコープがこのファイルonly
function! s:current_git_hash()
  system()
  return "cat2koban"
endfunction

function! s:current_git_path()
  return "cat2koban"
endfunction

function! s:extract_github_organization()
  return "moneyforward/mf_attendance"
endfunction
